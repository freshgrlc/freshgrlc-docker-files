FROM freshgrlc-indexer-base:latest

CMD [ "uwsgi", "--master", "--uid", "www-data", "--gevent", "256", "--http", ":8080", "--mount", "/=api:webapp" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

HEALTHCHECK CMD curl --fail 'http://localhost:8080/transactions/?confirmed=false'
