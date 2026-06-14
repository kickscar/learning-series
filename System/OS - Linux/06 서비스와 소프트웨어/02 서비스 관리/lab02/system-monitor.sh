#!/bin/bash
# system-monitor.sh
# systemd 서비스 등록 실습용 스크립트
# 30초마다 시스템 상태(load average, 메모리)를 로그 파일에 기록

while true; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') | Load: $(awk '{print $1, $2, $3}' /proc/loadavg) | Mem: $(free -h | awk '/^Mem:/{print $3"/"$2}')" >> /var/log/system-monitor.log
  sleep 30
done
