FROM garlicoin-core-base:latest

CMD [ "garlicoind", "-nodaemon", "-printtoconsole" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 42068 42069
