#!/bin/bash


msg () {
    echo ""
    echo "  >>> $1"
    echo ""
}


while true; do \
    for d in /usr/src/*; do \
        cd "$d" && \
        git fetch && \
        verify-checkout-latest-tag && \
        msg "Building new tag $(cd "$d" && git tag -l --sort=-v:refname | head -n1) in $d" && \
        do-build "$d"
    done

    sleep 10m
done
