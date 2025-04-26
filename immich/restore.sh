#!/usr/bin/env bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/common.env

# By default we restore using the Samsung 850 (254Gb) SSD
BACKUP_DISK=${BACKUP_DISK:-$BACKUP_SAMSUNG_SSD}

echo "Navigating to the immich app dir"
cd $IMMICH_APP_DIR

echo "Stopping running immich app"
docker compose down

echo "Removing previous data: {library,postgresql}"
sudo rm -rf ./library
sudo rm -rf ./posgresql

echo "---"

echo "Checking if previous Borg backup is mounted in $BACKUP_MOUNTPOINT"
if mountpoint -q "$BACKUP_MOUNTPOINT"; then
  echo "Previous backup is mounted in $BACKUP_MOUNTPOINT"
  umount $BACKUP_MOUNTPOINT
  echo "Unmounted $BACKUP_MOUNTPOINT"
else
  echo "No previous backup is mounted in $BACKUP_MOUNTPOINT"
fi

echo "Mounting backup data from: $BACKUP_DISK"
borg mount \
	"$BACKUP_DISK/immich-borg" \
	$BACKUP_MOUNTPOINT

echo "---"

RECENT_BACKUP_LOCATION=$(ls -d $BACKUP_MOUNTPOINT/????-??-??--??-?? | tail -n 1)
echo "Restoring the library folder from backup: $RECENT_BACKUP_LOCATION"
cp -r $RECENT_BACKUP_LOCATION/library .
echo "Copied the backed up library successfully!"

echo "Preparing for PostgreSQL restore"
echo "Creating immich containers"
docker compose create

echo "Starting PostgreSQL"
docker start immich_postgres
sleep 10

echo "Restoring PostgreSQL"
cat library/database-backup/immich-database.sql \
	| sed "s/SELECT pg_catalog.set_config('search_path', '', false);/SELECT pg_catalog.set_config('search_path', 'public, pg_catalog', true);/g" \
	| docker exec -i immich_postgres psql --dbname=postgres --username=postgres

echo "Starting the immich app"
docker compose up -d

BACKUP_FOLDER=$(basename $RECENT_BACKUP_LOCATION)
echo "Successfully restored immich from backup: $BACKUP_DISK/immich-borg/$BACKUP_FOLDER"
