#!/bin/bash

THRESHOLD=80
LOG_FILE="/var/log/disk_monitor.log"
EMAIL="admin@example.com"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

echo "$(date): Checking disk usage..." | tee -a $LOG_FILE

# Get disk usage percentage
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

if [[ $USAGE -ge $THRESHOLD ]]; then
    MESSAGE="Warning: Disk usage is at ${USAGE}%!"
    echo "$MESSAGE" | tee -a $LOG_FILE
    echo "$MESSAGE" | mail -s "Disk Usage Alert" $EMAIL
else
    echo "Disk usage is normal ($USAGE%)." | tee -a $LOG_FILE
fi
