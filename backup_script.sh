MAX_BACKUPS=5
HOST="db:6362"
BACKUP_DIR="/var/lib/neo4j/backups"
CRON_LOG="/var/lib/neo4j/cron.log"

/var/lib/neo4j/bin/neo4j-admin database backup --to-path=$BACKUP_DIR --from=$HOST >> $CRON_LOG 2>&1

# Backup rotation: Keep only the $MAX_BACKUPS most recent backups
cd $BACKUP_DIR
ls -tp | grep -v '/$' | tail -n +$((MAX_BACKUPS + 1)) | xargs -d '\n' -r rm --