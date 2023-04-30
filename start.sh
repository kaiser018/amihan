#!/bin/bash
source .env

if [ "$DB_HOST" = "localhost" ] || [ "$DB_HOST" = "127.0.0.1" ]; then
  DB_HOST="host.docker.internal"
fi

docker run --rm \
  --expose $SERVER_PORT \
  -p $SERVER_PORT:$SERVER_PORT \
  -e SERVER_PORT=$SERVER_PORT \
  -e DB_HOST=$DB_HOST \
  -e DB_USER=$DB_USER \
  -e DB_PASSWORD=$DB_PASSWORD \
  -e DB_DATABASE=$DB_DATABASE \
  --name amihan kaiser018/amihan:latest