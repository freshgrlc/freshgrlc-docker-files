#!/bin/bash
set -e

#
# Until we have a proper executable to
# install we run out of the sourcetree.
#
export PATH="$(pwd)/build:${PATH}"

if [ "${1:0:1}" = '-' ]; then
    set -- test "$@"
fi

exec "$@"
