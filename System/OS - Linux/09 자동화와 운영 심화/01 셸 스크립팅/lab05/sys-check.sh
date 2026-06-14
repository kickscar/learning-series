#!/bin/bash

separator() {
    echo "──────────────────────────────────"
}

check_host() {
    echo "Hostname : $(hostname)"
    echo "Kernel   : $(uname -r)"
    echo "Uptime   : $(uptime -p)"
}

check_disk() {
    local threshold=${1:-80}
    local usage
    usage=$(df / --output=pcent | tail -1 | tr -d ' %')

    echo "Disk (/) : ${usage}%"
    if [ "$usage" -ge "$threshold" ]; then
        echo "  → [WARNING] exceeds ${threshold}%"
    fi
}

check_memory() {
    local total used avail
    total=$(free -h | awk '/^Mem:/ {print $2}')
    used=$(free -h | awk '/^Mem:/ {print $3}')
    avail=$(free -h | awk '/^Mem:/ {print $7}')

    echo "Memory   : ${used} / ${total} (available: ${avail})"
}

check_services() {
    local services="sshd nginx chronyd firewalld"
    for svc in $services; do
        local status
        status=$(systemctl is-active "$svc" 2>/dev/null)
        if [ "$status" = "active" ]; then
            echo "  [RUNNING] $svc"
        else
            echo "  [STOPPED] $svc"
        fi
    done
}

echo "=== System Check: $(date '+%Y-%m-%d %H:%M:%S') ==="
separator

echo "[Host]"
check_host
separator

echo "[Disk]"
check_disk "${1:-80}"
separator

echo "[Memory]"
check_memory
separator

echo "[Services]"
check_services
separator

echo "Done."
