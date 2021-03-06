#!/bin/bash

if [[ -z "${TM_SERVER_NAME}" ]]
then
    echo "Trackmania server name was not specified."
    echo "Please consider filling the field."
fi

if [[ -z "${TM_SERVER_PWD}" ]]
then
    echo "Trackmania server password was not specified."
    echo "Please consider filling the field, if you are protecting your server."
fi

if [[ -z "${DATA_DIR}" ]]
then
    echo "The data directory was not specified."
    echo "Defaulting to ./data"
    export DATA_DIR=./data
fi

if [[ -z "${SQL_HOST}" ]]
then
    echo "The SQL host was not specified."
    echo "Exiting..."
    exit 1
fi

if [[ -z "${SQL_PORT}" ]]
then
    echo "There was no implicit SQL port specified."
    echo "Defaulting to 3306."
    export SQL_PORT=3306
fi

if [[ -z "${SQL_USER}" ]]
then
    echo "The SQL user was not specified."
    echo "Exiting..."
    exit 1
fi

if [[ -z "${SQL_PWD}" ]]
then
    echo "The SQL password was not specified."
    echo "Exiting..."
    exit 1
fi

if [[ -z "${SQL_DATABASE}" ]]
then
    echo "There was no SQL database specified."
    echo "Exiting..."
    exit 1
fi

if [[ -z "${TELEGRAM_TOKEN}" ]]
then
    echo "The telegram token is missing."
    echo "Exiting..."
    exit 1
fi

if [[ -z "${TELEGRAM_GROUP_ID}" ]]
then
    echo "The telegram group chat id is missing."
    echo "Exiting..."
    exit 1
fi

echo "Finished initialization"
echo "Evaluating config file"

envsubst < /var/app/_config.ini > /var/app/config.ini

echo "Printing the complete configuration:"
echo ""
cat /var/app/config.ini

# Finished with docker logs.
# Continuing to execution.

exec "$@"
