#!/bin/bash

SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
LOG_FILE="/var/log/backup.log"

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

echo "$(date): Starting backup of $SOURCE_DIR to $BACKUP_FILE" | tee -a $LOG_FILE

# Perform backup
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

if [[ $? -eq 0 ]]; then
    echo "Backup completed successfully." | tee -a $LOG_FILE
else
    echo "Backup failed!" | tee -a $LOG_FILE
    exit 1
fi
