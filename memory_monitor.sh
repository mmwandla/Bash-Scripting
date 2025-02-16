#!/bin/bash

THRESHOLD=80
LOG_FILE="/var/log/memory_monitor.log"
EMAIL="admin@example.com"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

echo "$(date): Checking memory usage..." | tee -a $LOG_FILE

# Get memory usage percentage
USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

if [[ $USAGE -ge $THRESHOLD ]]; then
    MESSAGE="Warning: Memory usage is at ${USAGE}%!"
    echo "$MESSAGE" | tee -a $LOG_FILE
    echo "$MESSAGE" | mail -s "Memory Usage Alert" $EMAIL
else
    echo "Memory usage is normal ($USAGE%)." | tee -a $LOG_FILE
fi
