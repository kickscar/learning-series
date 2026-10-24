#!/usr/bin/env bash
# 실습 클러스터 삭제: Organization=k8s-core · Project=cluster 태그 자원을 생성의 역순으로 삭제한다
set -euo pipefail

export AWS_REGION="${AWS_REGION:-ap-northeast-2}"
ORG="k8s-core"
PROJECT="cluster"
KEY_NAME="key-k8s-core"
F_ORG="Name=tag:Organization,Values=$ORG"
F_PROJECT="Name=tag:Project,Values=$PROJECT"

IDS=$(aws ec2 describe-instances --filters "$F_ORG" "$F_PROJECT" \
  "Name=instance-state-name,Values=pending,running,stopping,stopped" \
  --query 'Reservations[].Instances[].InstanceId' --output text)
if [ -n "$IDS" ]; then
  aws ec2 terminate-instances --instance-ids $IDS > /dev/null
  aws ec2 wait instance-terminated --instance-ids $IDS
  echo "terminated: $IDS"
fi

for SG in $(aws ec2 describe-security-groups --filters "$F_ORG" "$F_PROJECT" --query 'SecurityGroups[].GroupId' --output text); do
  aws ec2 delete-security-group --group-id "$SG" > /dev/null && echo "deleted: $SG"
done

for RTB in $(aws ec2 describe-route-tables --filters "$F_ORG" "$F_PROJECT" --query 'RouteTables[].RouteTableId' --output text); do
  for ASSOC in $(aws ec2 describe-route-tables --route-table-ids "$RTB" \
      --query 'RouteTables[0].Associations[?!Main].RouteTableAssociationId' --output text); do
    aws ec2 disassociate-route-table --association-id "$ASSOC"
  done
  aws ec2 delete-route-table --route-table-id "$RTB" && echo "deleted: $RTB"
done

for SUBNET in $(aws ec2 describe-subnets --filters "$F_ORG" "$F_PROJECT" --query 'Subnets[].SubnetId' --output text); do
  aws ec2 delete-subnet --subnet-id "$SUBNET" && echo "deleted: $SUBNET"
done

for VPC in $(aws ec2 describe-vpcs --filters "$F_ORG" "$F_PROJECT" --query 'Vpcs[].VpcId' --output text); do
  for IGW in $(aws ec2 describe-internet-gateways --filters "Name=attachment.vpc-id,Values=$VPC" \
      --query 'InternetGateways[].InternetGatewayId' --output text); do
    aws ec2 detach-internet-gateway --internet-gateway-id "$IGW" --vpc-id "$VPC"
    aws ec2 delete-internet-gateway --internet-gateway-id "$IGW" && echo "deleted: $IGW"
  done
  aws ec2 delete-vpc --vpc-id "$VPC" && echo "deleted: $VPC"
done

if aws ec2 describe-key-pairs --key-names "$KEY_NAME" > /dev/null 2>&1; then
  aws ec2 delete-key-pair --key-name "$KEY_NAME" > /dev/null && echo "deleted: key pair $KEY_NAME"
fi
# AWS 키 페어가 없으면 로컬 개인 키도 쓸 수 없으므로 함께 삭제한다
if [ -f "$HOME/.ssh/$KEY_NAME.pem" ]; then
  rm -f "$HOME/.ssh/$KEY_NAME.pem" && echo "deleted: ~/.ssh/$KEY_NAME.pem"
fi
