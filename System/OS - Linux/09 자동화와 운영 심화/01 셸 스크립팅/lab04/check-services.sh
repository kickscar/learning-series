#!/bin/bash

SERVICES="sshd nginx chronyd firewalld"

for svc in $SERVICES; do
    STATUS=$(systemctl is-active "$svc" 2>/dev/null)
    if [ "$STATUS" = "active" ]; then
        echo "[RUNNING] $svc"
    else
        echo "[STOPPED] $svc"
    fi
done
