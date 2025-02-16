#!/bin/bash

PACKAGES=("curl" "wget" "git" "vim" "htop")
LOG_FILE="/var/log/software_install.log"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

echo "$(date): Installing software packages..." | tee -a $LOG_FILE

for PACKAGE in "${PACKAGES[@]}"; do
    echo "Installing $PACKAGE..." | tee -a $LOG_FILE
    apt install -y $PACKAGE
done

echo "Software installation completed." | tee -a $LOG_FILE
