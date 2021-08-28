FROM freshgrlc-wallet-base:latest

CMD [ "python", "backgroundprocessor.py" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

#
#   Not really a healtcheck but keeps the status as 'starting' until
#   startup and startup-time processing is complete, making it easier
#   to spot issues.
#
HEALTHCHECK --interval=5s --start-period=1m CMD test -f /run/wallet.pid
