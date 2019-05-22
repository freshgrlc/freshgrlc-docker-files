FROM garlicoin-core-base:latest

CMD [ "garlicoind", "-testnet", "-nodaemon", "-printtoconsole" ]

COPY entrypoint.sh /entrypoint.sh
COPY mine-testnet.sh /mine-testnet.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 42070 42075
