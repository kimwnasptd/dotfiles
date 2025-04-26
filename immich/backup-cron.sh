#!/usr/bin/env bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/common.env

echo "Ensuring the directory $IMMICH_APP_DIR/library exists"
mkdir -p "$IMMICH_APP_DIR/library"

echo "Navigating to the immich app dir"
cd $IMMICH_APP_DIR

echo "---"

echo "Backing up PostgreSQL"
docker exec -t immich_postgres \
	pg_dumpall --clean --if-exists --username=postgres \
	> "$UPLOAD_LOCATION"/database-backup/immich-database.sql
echo "Backup completed successfully!"

echo "---"

echo "Checking if previous Borg backup is mounted in $BACKUP_MOUNTPOINT"
if mountpoint -q "$BACKUP_MOUNTPOINT"; then
  echo "Previous backup is mounted in $BACKUP_MOUNTPOINT"
  umount $BACKUP_MOUNTPOINT
  echo "Unmounted $BACKUP_MOUNTPOINT"
else
  echo "No previous backup is mounted in $BACKUP_MOUNTPOINT"
fi

echo "---"

echo "Copying backup to Samsung 850 SSD"
export BACKUP_DATE=$(date +%Y-%m-%d--%H-%M)
borg create \
	"$BACKUP_SAMSUNG_SSD/immich-borg::$BACKUP_DATE" \
	"$UPLOAD_LOCATION"

echo "Copying backup to Patriot Burst SSD"
borg create \
	"$BACKUP_PATRIOT_SSD/immich-borg::$BACKUP_DATE" \
	"$UPLOAD_LOCATION"

echo "Making backup more compact in SSDs"
borg compact "$BACKUP_SAMSUNG_SSD/immich-borg"
borg compact "$BACKUP_PATRIOT_SSD/immich-borg"

echo "---"
echo "Backup completed successfully! $BACKUP_DATE"
