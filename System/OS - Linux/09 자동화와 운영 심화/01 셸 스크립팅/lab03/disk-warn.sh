#!/bin/bash

THRESHOLD=${1:-80}
USAGE=$(df / --output=pcent | tail -1 | tr -d ' %')

echo "Disk usage: ${USAGE}%"
echo "Threshold:  ${THRESHOLD}%"

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "[WARNING] Disk usage exceeds threshold!"
    exit 1
else
    echo "[OK] Disk usage is normal."
    exit 0
fi
