BACKUP_DIR="/var/lib/neo4j/backups"

/var/lib/neo4j/bin/neo4j-admin database backup --to-path=$BACKUP_DIR --from=db:6362 >> /var/lib/neo4j/cron.log 2>&1
