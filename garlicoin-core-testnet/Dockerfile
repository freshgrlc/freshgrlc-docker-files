FROM garlicoin-core-base:latest

CMD [ "garlicoind", "-testnet", "-nodaemon", "-printtoconsole" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 42070 42075
