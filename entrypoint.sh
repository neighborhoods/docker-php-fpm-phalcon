#! /bin/bash

set -e

echo "Starting entrypoint script"
CONF_DIR="/usr/local/etc/php/conf.d"

echo "Substituting environment variables in newrelic config"
envsubst < "$CONF_DIR/newrelic.ini.template" > "$CONF_DIR/newrelic.ini"

echo "New config file:"
cat "$CONF_DIR/newrelic.ini"

echo "Done with entrypoint, running 'exec $@'"
exec "$@"