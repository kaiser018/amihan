#!/bin/bash
source .env

if mysql -u "$DB_USERNAME" -p"$DB_PASSWORD" -h "$DB_HOST" -D "$DB_DATABASE" < ./sql/sample.sql; then
    echo "Sample Data has been imported successfully"
else
    echo "Error: Failed to execute MySQL command"
fi