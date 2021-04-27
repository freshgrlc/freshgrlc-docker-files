#!/bin/bash
set -e

if [ ! -f /usr/src/freshgrlc-indexer/config.py ]; then \
    cat > /usr/src/freshgrlc-indexer/config.py <<EOF

class Configuration(object):
    COIN_TICKER = '${DATABASE}'
    DAEMON_URL = ''
    DATABASE_URL = 'mysql+pymysql://${DBUSER}:${DBPASSWORD}@${DBHOST}:3306/${DATABASE}'

    UTXO_CACHE = False

    API_ENDPOINT = '${EXTERNAL_BASEURL}'

    DEBUG_SQL = False

EOF
fi

export PYTHONUNBUFFERED=1

if [ "${1:0:1}" = '-' ]; then
    set -- "uwsgi" "--master" "--uid" "www-data" "--gevent" "256" "--http" ":8080" "--mount" "/=api:webapp" "$@"
fi

exec "$@"
