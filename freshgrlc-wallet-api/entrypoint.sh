#!/bin/bash
set -e

if [ ! -f /usr/src/freshgrlc-wallet/config_private.py ]; then \
    cat > /usr/src/freshgrlc-wallet/config_private.py <<EOF

ENCRYPTION_KEY          = '${ENCRYPTIONKEY}'
DATABASE_CREDENTIALS    = ('${DBUSER}', '${DBPASSWORD}')
COINDAEMON_CREDENTIALS  = ('${RPCUSER}', '${RPCPASSWORD}')
KEYSEEDER_CREDENTIALS   = ('${KEYSEEDERRPCUSER}', '${KEYSEEDERRPCPASSWORD}')

EOF
fi

export PYTHONUNBUFFERED=1

if [ "${1:0:1}" = '-' ]; then
    set -- "uwsgi" "--master" "--uid" "www-data" "--http" ":8080" "--mount" "/=api:webapp" "$@"
fi

exec "$@"
