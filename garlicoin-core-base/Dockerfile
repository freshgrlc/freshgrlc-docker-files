FROM garlicoin-core-source:latest

RUN cd /tmp/garlicoin-core-0.16.0 \
    && ./configure --disable-tests --disable-bench --disable-zmq --disable-wallet \
    && make -j16 \
    && make install \
    && cd / \
    && rm -Rf /tmp/garlicoin-core-0.16.0

VOLUME /var/lib/garlicoind

HEALTHCHECK CMD su - garlicoind -c 'garlicoin-cli getblocktemplate'
