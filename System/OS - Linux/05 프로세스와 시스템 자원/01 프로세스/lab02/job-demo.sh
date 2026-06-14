#!/bin/sh
# job-demo.sh
# 포어그라운드/백그라운드/정지 상태 차이를 체험하는 스크립트
# 포어그라운드일 때만 카운트를 출력한다

COUNT=1

while true
do
  if [ "$(ps -o pgrp= -p $$)" = "$(ps -o tpgid= -p $$)" ]; then
    echo "[FG] Running... (Count: $COUNT)"
  fi

  COUNT=$((COUNT + 1))
  sleep 1
done
