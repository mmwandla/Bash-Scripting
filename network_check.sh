#!/bin/bash

PING_TARGET=$(hostname)
LOG_FILE="/var/log/network_check.log"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

echo "$(date): Checking network connectivity..." | tee -a $LOG_FILE

if ping -c 3 $PING_TARGET > /dev/null 2>&1; then
    echo "Network is online." | tee -a $LOG_FILE
else
    echo "Network is down!" | tee -a $LOG_FILE
fi
