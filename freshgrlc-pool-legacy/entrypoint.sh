#!/bin/bash
set -e

mv pool.js pool.js.orig
sed 's/127.0.0.1/'"${DAEMON_HOST}"'/g' < pool.js.orig > pool.js

cat > credentials.js <<EOF
module.exports.walletApiToken = '${WALLET_TOKEN}';
EOF

redis-server > /var/log/redis.log 2>&1 &

if [ "${1:0:1}" = '-' ]; then
    set -- "node" "pool.js" "$@"
fi

exec "$@"
