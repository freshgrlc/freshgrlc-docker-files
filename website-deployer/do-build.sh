#!/bin/bash

deploy () {
    rm -Rf "/var/auto-deploy/$2.old" "/var/auto-deploy/$2.new" || return 1
    mkdir -p "/var/auto-deploy/$2" || return 1
    mv "$1" "/var/auto-deploy/$2.new" || return 1
    mv "/var/auto-deploy/$2" "/var/auto-deploy/$2.old" || return 1
    mv "/var/auto-deploy/$2.new" "/var/auto-deploy/$2" || return 1
    rm -Rf "/var/auto-deploy/$2.old"

    echo ""
    echo "  >>> Deployed to /var/auto-deploy/$2."
    echo ""
}

test -z "$1" && exit 1

case $(basename "$1") in
    freshgrlc-explorer)
        rm -Rf node_modules && \
        yarn install && \
        yarn build && \
        deploy build explorer
        ;;
    freshgrlc-pool-website)
        rm -Rf build
        mkdir -p build
        cp -a css/ fonts/ hashratecheck/ js/ neverforget/ *.html *.gif *.png build/
        deploy build pool
        ;;
    *)
        echo "Unexpected project: $(basename "$1")"
        exit 1
        ;;
esac
