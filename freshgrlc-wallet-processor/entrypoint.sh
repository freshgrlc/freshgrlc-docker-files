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
    set -- python backgroundprocessor.py "$@"
fi

exec "$@"
