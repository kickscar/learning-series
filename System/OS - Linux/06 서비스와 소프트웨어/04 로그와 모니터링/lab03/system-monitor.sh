#!/bin/bash
# system-monitor.sh (v2: 표준 로깅 버전)
# stdout으로 출력 → systemd가 journald에 전달 → rsyslog가 /var/log에 기록
# 직접 파일 기록(>> /var/log/...)을 사용하지 않는다

while true; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') | Load: $(awk '{print $1, $2, $3}' /proc/loadavg) | Mem: $(free -h | awk '/^Mem:/{print $3"/"$2}')"
  sleep 30
done
