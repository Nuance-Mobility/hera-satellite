#!/bin/bash
set -e

export PATH=$PATH:/etc/sensu/plugins:/etc/sensu/handlers

if [ "$1" = 'start' ]; then

    if [ -a /etc/sensu/conf.d/extra-setup.sh ]; then
        echo "Performing extra setup"
        exec chmod +x /etc/sensu/conf.d/extra-setup.sh
        exec /etc/sensu/conf.d/extra-setup.sh
    fi
    exec /opt/sensu/bin/sensu-client \
        -c /etc/sensu/config.json -d /etc/sensu/conf.d \
        -e /etc/sensu/extensions -v \
        "$@"
fi

exec "$@"
