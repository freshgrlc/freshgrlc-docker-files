#!/bin/bash
set -e

if [ ! -f /usr/src/freshgrlc-indexer/config.py ]; then \
    cat > /usr/src/freshgrlc-indexer/config.py <<EOF

class Configuration(object):
    COIN_TICKER = '${DATABASE}'
    DAEMON_URL = 'http://${RPCUSER}:${RPCPASSWORD}@${RPCHOST}:${RPCPORT}'
    DATABASE_URL = 'mysql+pymysql://${DBUSER}:${DBPASSWORD}@${DBHOST}:3306/${DATABASE}'

    UTXO_CACHE = False

    API_ENDPOINT = ''

    DEBUG_SQL = False

EOF
fi

export PYTHONUNBUFFERED=1

if [ "${1:0:1}" = '-' ]; then
    set -- python indexer.py "$@"
fi

exec "$@"
