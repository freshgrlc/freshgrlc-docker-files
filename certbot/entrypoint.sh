#!/bin/bash
set -e

[ ! -z "${NGINX_USERNAME}" ]
[ ! -z "${NGINX_PASSWORD}" ]

htpasswd -b -c /etc/nginx/htpasswd "${NGINX_USERNAME}" "${NGINX_PASSWORD}"

bash -c 'while true; do /usr/bin/certbot renew; sleep 1d; done' &
sleep 10
[ "$(jobs -r -p | wc -l)" = 1 ]

if [ "${1:0:1}" = '-' ]; then
    set -- 'nginx' '-g' 'daemon off;' "$@"
fi

exec "$@"
