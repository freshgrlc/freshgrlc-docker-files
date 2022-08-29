FROM garlicoin-core-source:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libdb5.3++-dev \
    && rm -rf /var/lib/apt/lists/*

RUN cd /usr/src/garlicoin-core \
    && ./configure --disable-tests --disable-bench --disable-zmq --with-incompatible-bdb \
    && make -j`nproc` \
    && make install \
    && make clean

VOLUME /var/lib/garlicoind
HEALTHCHECK CMD su - garlicoind -c 'garlicoin-cli uptime'

CMD [ "garlicoind", "-nodaemon", "-printtoconsole", "-connect=0", "-listen=0" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 42068

