#!/bin/bash
set -e

if [ ! -d /var/lib/garlicoind/.garlicoin ]; then \
    mkdir /var/lib/garlicoind/.garlicoin

    [ -z "${RPCPASSWORD}" ] && RPCPASSWORD="$(dd if=/dev/urandom bs=45 count=1 | base64)"
    [ -z "${RPCUSER}" ] && RPCUSER=rpcuser

    cat > /var/lib/garlicoind/.garlicoin/garlicoin.conf <<EOF

upnp=0
server=1
listen=1

rpcuser=${RPCUSER}
rpcpassword=${RPCPASSWORD}
rpcport=42070

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
    if [ ! -z "${MINE}" ]; then \
        echo "Launching testnet miner in the background..."
        [ ! -z "${MINING_ADDRESS}" ] && \
        echo "   > Mining to address: ${MINING_ADDRESS}"

        gosu garlicoind /mine-testnet.sh ${MINING_ADDRESS} &
    fi

    exec gosu garlicoind "$@"
fi

exec "$@"
