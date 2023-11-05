#!/bin/bash
set -e

sed -E -i.old 's/^ {12}"host":.*$/"host": "'"${DAEMON_HOST}"'",/' pool.js
sed -E -i.old 's/^ {12}"port":.*$/"port": '"${DAEMON_PORT}"',/' pool.js
sed -E -i.old 's/^ {12}"user":.*$/"user": "'"${DAEMON_USERNAME}"'",/' pool.js
sed -E -i.old 's/^ {12}"password":.*$/"password": "'"${DAEMON_PASSWORD}"'",/' pool.js

sed -E -i.old 's/^ {8}"host":.*$/"host": "'"${P2P_HOST}"'",/' pool.js
sed -E -i.old 's/^ {8}"port":.*$/"port": '"${P2P_PORT}"',/' pool.js

if [ "${1:0:1}" = '-' ]; then
    set -- "node" "pool.js" "$@"
fi

exec "$@"
