#!/bin/bash
set -euo pipefail

LOG_FILE="/var/log/server_health.log"
CPU_THRESHOLD=80
MEM_THRESHOLD=85
DISK_THRESHOLD=85

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
MEM_USAGE=$(free | awk '/Mem:/ {printf("%d", $3/$2 * 100)}')
DISK_USAGE=$(df -h / | awk 'NR==2 {gsub("%",""); print $5}')

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "[$TIMESTAMP] CPU: ${CPU_USAGE}% | MEM: ${MEM_USAGE}% | DISK: ${DISK_USAGE}%" >> "$LOG_FILE"

if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ] || [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ] || [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "[$TIMESTAMP] ALERT: Resource threshold exceeded!" >> "$LOG_FILE"
fi
