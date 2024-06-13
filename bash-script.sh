#!/bin/bash
echo "CPU Usage:"
top 


echo "Memory Usage:"
free -m


echo "Top CPU consuming processes:"
top top -o %CPU -n 10


echo "Top Memory consuming processes:"
top -b -o %MEM -n 10 | tail -n +8 | head -n 10


echo "start of backup script"

# MySQL database credentials
DB_USER="mysql_user"
DB_PASSWORD="mysql_passwd"
DB_NAME="database_name"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR


BACKUP_DIR="/path/to/backup/directory"  #here add the path of backup directory

BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup.sql"

mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

MYSQL_DUMP_EXIT_STATUS=$?

# Check if backup was successful
if [ $MYSQL_DUMP_EXIT_STATUS -eq 0 ]; then
  echo "MySQL backup successfully created: $BACKUP_FILE"
else
  echo "Error: MySQL backup failed."
fi


