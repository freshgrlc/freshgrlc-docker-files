#!/bin/bash
set -e

if [ ! -f /var/lib/garlicoind/.garlicoin/garlicoin.conf ]; then \
    mkdir -p /var/lib/garlicoind/.garlicoin

    [ -z "${RPCPASSWORD}" ] && RPCPASSWORD="$(dd if=/dev/urandom bs=45 count=1 | base64)"
    [ -z "${RPCUSER}" ] && RPCUSER=rpcuser

    cat > /var/lib/garlicoind/.garlicoin/garlicoin.conf <<EOF

upnp=0
server=1
listen=0

rpcuser=${RPCUSER}
rpcpassword=${RPCPASSWORD}
rpcport=42068
rpcbind=0.0.0.0:42068
rpcallowip=0.0.0.0/0

daemon=0
printtoconsole=1

txindex=1

mintxfee=0.00005
minrelaytxfee=0.00005

EOF

    chown -R garlicoind:garlicoind /var/lib/garlicoind/.garlicoin
fi

if [ "${1:0:1}" = '-' ]; then
    set -- garlicoind "$@"
fi

if [ "$1" = 'garlicoind' ]; then
    exec gosu garlicoind "$@"
fi

exec "$@"
