#!/bin/bash

#  add this using "sudo crontab -e" to run this script at a set time
#  0 5 * * * /usr/local/bin/backup.sh
# stop the service to perform a statefull backup
systemctl stop 7days # stops 7days service
# pause for 30 seconds
sleep 30
SOURCE_DIR="/home/7days/7days/saves"  # Replace with your game's directory
BACKUP_DIR="/home/backup" # Replace with your backup directory
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BACKUP_NAME="game_backup_$TIMESTAMP"
FULL_BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

# Create backup directory if it doesn't exist
mkdir -p "$FULL_BACKUP_PATH"

# Copy game files using rsync
rsync -av "$SOURCE_DIR/" "$FULL_BACKUP_PATH/"

echo "Backup completed to $FULL_BACKUP_PATH"

# Remove old backups (e.g., keep only the last 7 days)
# this will delete call backups when run.
# this command is called in a separate file.
#find "$BACKUP_DIR" -maxdepth 1 -type d -name "game_backup_*" -mtime +7 -exec rm -rf {} \;
systemctl start 7days #starts 7days service
