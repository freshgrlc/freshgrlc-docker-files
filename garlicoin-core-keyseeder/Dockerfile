FROM garlicoin-core-source:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libdb5.3++-dev \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp/garlicoin-core-0.16.0 \
    && ./configure --disable-tests --disable-bench --disable-zmq --with-incompatible-bdb \
    && make -j16 \
    && make install \
    && cd / \
    && rm -Rf /tmp/garlicoin-core-0.16.0

VOLUME /var/lib/garlicoind
HEALTHCHECK CMD su - garlicoind -c 'garlicoin-cli uptime'

CMD [ "garlicoind", "-nodaemon", "-printtoconsole", "-connect=0", "-listen=0" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 42068

