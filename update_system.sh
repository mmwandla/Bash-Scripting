#!/bin/bash

LOG_FILE="/var/log/system_update.log"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

echo "$(date): Updating system..." | tee -a $LOG_FILE

# Update packages
apt update && apt upgrade -y && apt autoremove -y && apt clean

echo "System update completed successfully." | tee -a $LOG_FILE
