#!/bin/bash

##
##  Attempt to mine a block at least every ~ 15 minutes to keep the testnet going
##

address="$1"
[ -z "$address" ] && address="mhexk1vKMVG7V8ojWRAc8N8eJg2R3P4HhV"

while true; do \
    sleep $(( $RANDOM % 10 + 10 ))m
    garlicoin-cli generatetoaddress 1 ${address}
done
