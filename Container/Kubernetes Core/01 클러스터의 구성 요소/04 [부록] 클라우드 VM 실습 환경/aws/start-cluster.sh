#!/usr/bin/env bash
# 실습 클러스터 기동: cp → worker 순서. 공인 IP는 기동할 때마다 바뀐다
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
