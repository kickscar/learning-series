#!/bin/bash
# cpu-load.sh
# CPU 부하 생성 스크립트 — load average 실습용
# 사용법: ./cpu-load.sh [워커 수] [지속 시간(초)]
# 기본값: 워커 수 = CPU 코어 수, 지속 시간 = 180초
set -uo pipefail

WORKERS="${1:-$(nproc)}"
DURATION="${2:-180}"
pids=()
trap 'kill "${pids[@]}" 2>/dev/null; wait 2>/dev/null' EXIT INT TERM

echo "load with ${WORKERS} worker(s) for ${DURATION}s (Total Cores: $(nproc))"

for ((i=0; i<WORKERS; i++)); do
  sha1sum /dev/zero &
  pids+=("$!")
done

sleep "$DURATION"
