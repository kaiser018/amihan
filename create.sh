#!/bin/bash
source .env

# Read contents of database.sql into a variable
# Replace database name in SQL variable
SQL_SCRIPT=$(cat ./sql/database.sql | sed "s/{DB_DATABASE}/$DB_DATABASE/g")

if mysql -u "$DB_USERNAME" -p"$DB_PASSWORD" -h "$DB_HOST" -e "$SQL_SCRIPT"; then
    echo "Database has been created successfully"
else
    echo "Error: Failed to execute MySQL command"
fi