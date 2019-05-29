#!/bin/bash
set -e

if [ -z "${NO_HTTPS}" ]; then \
    [ ! -z "${CERTBOT_CREDENTIALS}" ]
    [ ! -z "${CERTBOT_DOMAIN}" ]

    mkdir -p '/etc/nginx/ssl'

    curl -u "${CERTBOT_CREDENTIALS}" "http://certbot:81/${CERTBOT_DOMAIN}/fullchain.pem" -o '/etc/nginx/ssl/certificate.pem'
    curl -u "${CERTBOT_CREDENTIALS}" "http://certbot:81/${CERTBOT_DOMAIN}/privkey.pem" -o '/etc/nginx/ssl/certificate.key'

    openssl rsa -in /etc/nginx/ssl/certificate.key -noout
    openssl x509 -in /etc/nginx/ssl/certificate.pem -noout
else
    rm /etc/nginx/conf.d/ssl/*
fi

if [ "${1:0:1}" = '-' ]; then
    set -- 'nginx' '-g' 'daemon off' "$@"
fi

exec "$@"
