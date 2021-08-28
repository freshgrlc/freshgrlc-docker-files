FROM freshgrlc-indexer-base:latest

CMD [ "python", "indexer.py" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

#
#   Not really a healtcheck but keeps the status as 'starting' until
#   synced, thereby making it easier to spot issues.
#
HEALTHCHECK --interval=5s --start-period=1h CMD test -f /run/indexer.pid
