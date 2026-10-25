#!/usr/bin/env bash
# 실습 클러스터 기동: 보안 그룹 허용 IP 갱신 → cp → worker 순서. 공인 IP는 기동할 때마다 바뀐다
set -euo pipefail

export AWS_REGION="${AWS_REGION:-ap-northeast-2}"
ORG="k8s-core"
PROJECT="cluster"
PREFIX="$ORG-$PROJECT"

ids() {
  aws ec2 describe-instances \
    --filters "Name=tag:Organization,Values=$ORG" "Name=tag:Project,Values=$PROJECT" \
              "Name=tag:Name,Values=$(printf "$PREFIX-instance-%s," "$@" | sed 's/,$//')" \
              "Name=instance-state-name,Values=stopped" \
    --query 'Reservations[].Instances[].InstanceId' --output text
}

# 보안 그룹: SSH · NodePort 허용 IP를 지금 호스트의 공인 IP로 바꾼다. 접속 장소가 바뀌면 공인 IP도 바뀐다
MY_IP="$(curl -s https://checkip.amazonaws.com)/32"
SG_ID=$(aws ec2 describe-security-groups \
  --filters "Name=tag:Organization,Values=$ORG" "Name=tag:Project,Values=$PROJECT" "Name=group-name,Values=$PREFIX-sg-node" \
  --query 'SecurityGroups[0].GroupId' --output text)
for RANGE in 22-22 30000-32767; do
  FROM=${RANGE%-*}
  for CIDR in $(aws ec2 describe-security-groups --group-ids "$SG_ID" \
      --query "SecurityGroups[0].IpPermissions[?FromPort==\`$FROM\`].IpRanges[].CidrIp" --output text); do
    aws ec2 revoke-security-group-ingress --group-id "$SG_ID" --protocol tcp --port "$RANGE" --cidr "$CIDR" > /dev/null
  done
  aws ec2 authorize-security-group-ingress --group-id "$SG_ID" --protocol tcp --port "$RANGE" --cidr "$MY_IP" > /dev/null
done
echo "Security group: $SG_ID (SSH · NodePort 허용: $MY_IP)"

CP=$(ids cp)
if [ -n "$CP" ]; then
  aws ec2 start-instances --instance-ids $CP > /dev/null
  aws ec2 wait instance-running --instance-ids $CP
  echo "running: cp"
fi

WORKERS=$(ids worker1 worker2)
if [ -n "$WORKERS" ]; then
  aws ec2 start-instances --instance-ids $WORKERS > /dev/null
  aws ec2 wait instance-running --instance-ids $WORKERS
  echo "running: worker1 · worker2"
fi

aws ec2 describe-instances --filters "Name=tag:Organization,Values=$ORG" "Name=tag:Project,Values=$PROJECT" "Name=instance-state-name,Values=running" \
  --query 'sort_by(Reservations[].Instances[], &PrivateIpAddress)[].[Tags[?Key==`Name`]|[0].Value,PrivateIpAddress,PublicIpAddress]' \
  --output table
