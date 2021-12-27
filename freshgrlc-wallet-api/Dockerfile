FROM freshgrlc-wallet-base:latest

CMD [ "uwsgi", "--master", "--uid", "www-data", "--gevent", "256", "--http", ":8080", "--mount", "/=api:webapp" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

