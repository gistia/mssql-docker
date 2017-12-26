#!/bin/bash

source .env

echo $USER / $PASSWORD

if ! nc -z localhost 1433 > /dev/null 2>&1; then
  echo 'Starting docker...'
  docker run -e 'ACCEPT_EULA=Y' -e "SA_PASSWORD=$PASSWORD" -p 1433:1433 -d microsoft/mssql-server-linux

  if [ $? -ne 0 ]; then
    echo 'Docker errored out'
    exit 1
  fi

  echo 'Waiting for MSSQL...'
  while ! nc -z localhost 1433; do
    echo 'Waiting for MSSQL...'
    sleep 0.5
  done

  sleep 5
fi

for f in startup/*.sql; do
  echo "Processing: $f"
  filename=$(basename "$f")
  filename="${filename%.*}"

  mssql -u "$USER" -p "$PASSWORD" -q "CREATE DATABASE [$filename]"
  mssql -u "$USER" -p "$PASSWORD" -d "$filename" -q ".run ${f}"
done

echo ''
echo 'Finished!'
