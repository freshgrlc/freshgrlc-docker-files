FROM garlicoin-core-source:latest

RUN cd /tmp/garlicoin-core-0.16.1 \
    && ./configure --disable-tests --disable-bench --disable-zmq --disable-wallet \
    && make -j16 \
    && make install \
    && cd / \
    && rm -Rf /tmp/garlicoin-core-0.16.1

VOLUME /var/lib/garlicoind

HEALTHCHECK --start-period=10m CMD su - garlicoind -c 'garlicoin-cli getblocktemplate'
