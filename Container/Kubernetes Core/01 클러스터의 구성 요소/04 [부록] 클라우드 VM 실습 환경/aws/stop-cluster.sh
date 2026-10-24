#!/usr/bin/env bash
# 실습 클러스터 정지: worker → cp 순서
set -euo pipefail

export AWS_REGION="${AWS_REGION:-ap-northeast-2}"
ORG="k8s-core"
PROJECT="cluster"
PREFIX="$ORG-$PROJECT"

ids() {
  aws ec2 describe-instances \
    --filters "Name=tag:Organization,Values=$ORG" "Name=tag:Project,Values=$PROJECT" \
              "Name=tag:Name,Values=$(printf "$PREFIX-instance-%s," "$@" | sed 's/,$//')" \
              "Name=instance-state-name,Values=pending,running" \
    --query 'Reservations[].Instances[].InstanceId' --output text
}

WORKERS=$(ids worker1 worker2)
if [ -n "$WORKERS" ]; then
  aws ec2 stop-instances --instance-ids $WORKERS > /dev/null
  aws ec2 wait instance-stopped --instance-ids $WORKERS
  echo "stopped: worker1 · worker2"
fi

CP=$(ids cp)
if [ -n "$CP" ]; then
  aws ec2 stop-instances --instance-ids $CP > /dev/null
  aws ec2 wait instance-stopped --instance-ids $CP
  echo "stopped: cp"
fi
