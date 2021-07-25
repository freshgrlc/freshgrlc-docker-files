#!/bin/bash

BASEDIR="/var/lib/cluster-monitor/status"
OUTFILE="/var/lib/cluster-monitor/out"

[ ! -d "$BASEDIR" ] && mkdir -p "$BASEDIR"
rm -f "${OUTFILE}"


out () {
    [ -f "${OUTFILE}" ] && echo "$1" >> "${OUTFILE}"
}

send_data () {
    if [ -f "${OUTFILE}" -a ! -z "$(cat "${OUTFILE}" 2> /dev/null)" ]; then \
        cat "${OUTFILE}"
        curl -s -X POST -H 'Content-Type: application/json' -d '{ "content": "'"$(cat "${OUTFILE}")"'" }' "${WEBHOOKURL}"
        rm -f "${OUTFILE}"
    fi
    touch "${OUTFILE}"
}

update () {
    f="$BASEDIR/$1"; shift
    name="$1"; shift

    [ ! -f "$f" ] && echo "[NO DATA]" > "$f"
    echo "$@" > "$f.new"
    if ! diff -q $f $f.new > /dev/null; then \
        out "$name update: $(cat "$f") => $(cat "$f.new")"
        mv -f "$f.new" "$f"
    fi
}


while sleep 2; do \
    update nodes "Cluster view" $(docker node ls | grep Active | sed 's/\*//' | awk '{ print $2 }')

    raw="$(docker service ls | grep -v NAME)"
    for svc in $(echo "$raw" | awk '{ print $2 }'); do \
        status="$(echo "$raw" | grep " $svc " | awk '{ print $4 }')"
        if [ ! -z "$(echo "$status" | grep "0/")" ]; then \
            update "svc.$svc" "Service $svc" "DOWN"
        else
            update "svc.$svc" "Service $svc" "UP $status"
        fi
    done

    send_data
done
