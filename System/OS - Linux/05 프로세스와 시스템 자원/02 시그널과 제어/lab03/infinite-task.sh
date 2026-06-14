#!/bin/sh
# infinite-task.sh
# nohup 실습용 스크립트
# stdout: 매초 INFO 출력
# stderr: 5회마다 ERROR 출력

COUNT=1

while true
do
  echo "[INFO] Task #$COUNT processed successfully. ($(date +%H:%M:%S))"

  if [ $((COUNT % 5)) -eq 0 ]; then
    echo "[ERROR] Task #$COUNT failed. ($(date +%H:%M:%S))" >&2
  fi

  COUNT=$((COUNT + 1))
  sleep 1
done
