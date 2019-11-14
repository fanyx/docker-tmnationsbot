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

if [[ -z "${WEB_DOMAIN}" ]]
then
    echo "Domain of your webserver was not specified."
    echo "Functionality is not provided."
    exit 2
fi

if [[ -z "${PLOT_DIR}" ]]
then
    echo "The plot directory was not specified."
    echo "Defaulting to /var/app/plots"
    export PLOT_DIR=/var/app/plots
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

fi [[ -z "${TELEGRAM_GROUP_ID}" ]]
then
    echo "The telegram group chat id is missing."
    echo "Exiting..."
    exit 1
fi

echo "Printing the complete configuration:"
echo ""
cat /var/app/config.ini

# Finished with docker logs.
# Continuing to execution.

exec python3 /var/app/main.py
