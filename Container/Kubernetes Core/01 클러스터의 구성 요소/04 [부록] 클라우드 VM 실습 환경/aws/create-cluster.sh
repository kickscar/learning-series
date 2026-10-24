#!/usr/bin/env bash
# Kubernetes Core 실습 클러스터 (AWS EC2): cp · worker1 · worker2
#
# VPC 192.168.0.0/16, 퍼블릭 서브넷 192.168.56.0/24, 사설 IP .10 · .11 · .12 고정
# Rocky Linux 9 공식 AMI(x86_64), t3.medium, 루트 볼륨 30GB gp3
# 자원 이름: {Organization}-{Project}-{capability}-{identity}, 태그 Name · Organization · Project
set -euo pipefail

REGION="${AWS_REGION:-ap-northeast-2}"
AZ="${REGION}a"
ORG="k8s-core"
PROJECT="cluster"
PREFIX="$ORG-$PROJECT"
KEY_NAME="key-k8s-core"
KEY_FILE="$HOME/.ssh/${KEY_NAME}.pem"
INSTANCE_TYPE="t3.medium"
VOLUME_SIZE=30
AMI_OWNER="792107900819"   # Rocky Enterprise Software Foundation

NODES=("cp:192.168.56.10" "worker1:192.168.56.11" "worker2:192.168.56.12")

export AWS_REGION="$REGION"

tags() { echo "ResourceType=$1,Tags=[{Key=Name,Value=$2},{Key=Organization,Value=$ORG},{Key=Project,Value=$PROJECT}]"; }
F_ORG="Name=tag:Organization,Values=$ORG"
F_PROJECT="Name=tag:Project,Values=$PROJECT"

# 같은 Organization · Project 태그의 VPC가 있으면 중단한다
if [ "$(aws ec2 describe-vpcs --filters "$F_ORG" "$F_PROJECT" --query 'length(Vpcs)' --output text)" != "0" ]; then
  echo "이미 $PREFIX 자원이 있다. delete-cluster.sh 로 정리한 뒤 다시 실행한다." >&2
  exit 1
fi

MY_IP="$(curl -s https://checkip.amazonaws.com)/32"

AMI_ID=$(aws ec2 describe-images --owners "$AMI_OWNER" \
  --filters "Name=name,Values=Rocky-9-EC2-Base-9.*" "Name=architecture,Values=x86_64" \
  --query 'sort_by(Images,&CreationDate)[-1].ImageId' --output text)
echo "AMI: $AMI_ID"

# 네트워크
VPC_ID=$(aws ec2 create-vpc --cidr-block 192.168.0.0/16 \
  --tag-specifications "$(tags vpc "$PREFIX-vpc")" --query Vpc.VpcId --output text)
aws ec2 modify-vpc-attribute --vpc-id "$VPC_ID" --enable-dns-hostnames
echo "VPC: $VPC_ID"

IGW_ID=$(aws ec2 create-internet-gateway \
  --tag-specifications "$(tags internet-gateway "$PREFIX-igw")" \
  --query InternetGateway.InternetGatewayId --output text)
aws ec2 attach-internet-gateway --internet-gateway-id "$IGW_ID" --vpc-id "$VPC_ID"
echo "IGW: $IGW_ID"

SUBNET_ID=$(aws ec2 create-subnet --vpc-id "$VPC_ID" --cidr-block 192.168.56.0/24 \
  --availability-zone "$AZ" \
  --tag-specifications "$(tags subnet "$PREFIX-subnet-public-a")" \
  --query Subnet.SubnetId --output text)
aws ec2 modify-subnet-attribute --subnet-id "$SUBNET_ID" --map-public-ip-on-launch
echo "Subnet: $SUBNET_ID"

RTB_ID=$(aws ec2 create-route-table --vpc-id "$VPC_ID" \
  --tag-specifications "$(tags route-table "$PREFIX-rtb-public")" \
  --query RouteTable.RouteTableId --output text)
aws ec2 create-route --route-table-id "$RTB_ID" --destination-cidr-block 0.0.0.0/0 \
  --gateway-id "$IGW_ID" > /dev/null
aws ec2 associate-route-table --route-table-id "$RTB_ID" --subnet-id "$SUBNET_ID" > /dev/null
echo "Route table: $RTB_ID"

# 보안 그룹: 노드 간 모든 트래픽, 내 IP에서 SSH(22)와 NodePort(30000-32767)
SG_ID=$(aws ec2 create-security-group --vpc-id "$VPC_ID" --group-name "$PREFIX-sg-node" \
  --description "Kubernetes Core cluster nodes" \
  --tag-specifications "$(tags security-group "$PREFIX-sg-node")" \
  --query GroupId --output text)
aws ec2 authorize-security-group-ingress --group-id "$SG_ID" \
  --ip-permissions "IpProtocol=-1,UserIdGroupPairs=[{GroupId=$SG_ID}]" > /dev/null
aws ec2 authorize-security-group-ingress --group-id "$SG_ID" \
  --ip-permissions "IpProtocol=tcp,FromPort=22,ToPort=22,IpRanges=[{CidrIp=$MY_IP}]" \
                   "IpProtocol=tcp,FromPort=30000,ToPort=32767,IpRanges=[{CidrIp=$MY_IP}]" > /dev/null
echo "Security group: $SG_ID (SSH · NodePort 허용: $MY_IP)"

# 키 페어: 없으면 만들고 개인 키를 로컬에 저장한다
if ! aws ec2 describe-key-pairs --key-names "$KEY_NAME" > /dev/null 2>&1; then
  mkdir -p "$HOME/.ssh"
  rm -f "$KEY_FILE"   # AWS에 없는 키의 남은 로컬 파일
  aws ec2 create-key-pair --key-name "$KEY_NAME" --key-type ed25519 \
    --tag-specifications "$(tags key-pair "$KEY_NAME")" \
    --query KeyMaterial --output text > "$KEY_FILE"
  chmod 400 "$KEY_FILE"
  echo "Key pair: $KEY_NAME → $KEY_FILE"
fi

# 인스턴스: 사설 IP 고정, cloud-init으로 호스트명 지정
for node in "${NODES[@]}"; do
  name="${node%%:*}"; ip="${node##*:}"
  aws ec2 run-instances --image-id "$AMI_ID" --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" --subnet-id "$SUBNET_ID" --private-ip-address "$ip" \
    --security-group-ids "$SG_ID" \
    --block-device-mappings "DeviceName=/dev/sda1,Ebs={VolumeSize=$VOLUME_SIZE,VolumeType=gp3}" \
    --user-data "$(printf '#cloud-config\nhostname: %s\nfqdn: %s\n' "$name" "$name")" \
    --tag-specifications "$(tags instance "$PREFIX-instance-$name")" "$(tags volume "$PREFIX-volume-$name")" \
    --query 'Instances[0].InstanceId' --output text > /dev/null
  echo "Instance: $name ($ip)"
done

IDS=$(aws ec2 describe-instances --filters "$F_ORG" "$F_PROJECT" \
  "Name=instance-state-name,Values=pending,running" --query 'Reservations[].Instances[].InstanceId' --output text)
aws ec2 wait instance-running --instance-ids $IDS

aws ec2 describe-instances --filters "$F_ORG" "$F_PROJECT" "Name=instance-state-name,Values=running" \
  --query 'sort_by(Reservations[].Instances[], &PrivateIpAddress)[].[Tags[?Key==`Name`]|[0].Value,PrivateIpAddress,PublicIpAddress]' \
  --output table
echo "접속: ssh -i $KEY_FILE rocky@{PublicIpAddress}"
