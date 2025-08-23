#!/bin/bash

#  add this using sudo crontab -e to run this script at a set time
#  @weekly /usr/local/bin/cleanbackup.sh
#systemctl stop 7days 
#sleep 30
SOURCE_DIR="/home/7days/7days/saves"  # Replace with your game's directory
BACKUP_DIR="/home/backup" # Replace with your backup directory
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BACKUP_NAME="game_backup_$TIMESTAMP"
FULL_BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

# Optional: Remove old backups (e.g., keep only the last 7 days)
find "$BACKUP_DIR" -maxdepth 1 -type d -name "game_backup_*" -mtime +7 -exec rm -rf {} \;
#systemctl start 7days
# This is just  a clean up script that runs once weekly.
# The command cleans out ALL backups existing that are created with rsync.
