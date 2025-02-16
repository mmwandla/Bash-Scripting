#!/bin/bash

SERVICE="nginx"
LOG_FILE="/var/log/service_monitor.log"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

echo "$(date): Checking service: $SERVICE" | tee -a $LOG_FILE

if systemctl is-active --quiet $SERVICE; then
    echo "$SERVICE is running." | tee -a $LOG_FILE
else
    echo "$SERVICE is down! Restarting..." | tee -a $LOG_FILE
    systemctl restart $SERVICE
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE restarted successfully." | tee -a $LOG_FILE
    else
        echo "Failed to restart $SERVICE!" | tee -a $LOG_FILE
    fi
fi
