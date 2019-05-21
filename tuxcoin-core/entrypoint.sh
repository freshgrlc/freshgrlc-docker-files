#!/bin/bash
set -e

if [ ! -d /var/lib/tuxcoind/.tuxcoin ]; then \
    mkdir /var/lib/tuxcoind/.tuxcoin

    [ -z "${RPCPASSWORD}" ] && RPCPASSWORD="$(dd if=/dev/urandom bs=45 count=1 | base64)"
    [ -z "${RPCUSER}" ] && RPCUSER=rpcuser

    cat > /var/lib/tuxcoind/.tuxcoin/tuxcoin.conf <<EOF

upnp=0
server=1
listen=1

rpcuser=${RPCUSER}
rpcpassword=${RPCPASSWORD}
rpcport=42072

daemon=0
printtoconsole=1

txindex=1

mintxfee=0.00005
minrelaytxfee=0.00005

EOF

    chown -R tuxcoind:tuxcoind /var/lib/tuxcoind/.tuxcoin
fi

if [ "${1:0:1}" = '-' ]; then
    set -- tuxcoind "$@"
fi

if [ "$1" = 'tuxcoind' ]; then
    exec gosu tuxcoind "$@"
fi

exec "$@"
