FROM garlicoin-core-source:latest

RUN cd /usr/src/garlicoin-core \
    && ./configure --disable-tests --disable-bench --disable-zmq --disable-wallet \
    && make -j`nproc` \
    && make install \
    && make clean

VOLUME /var/lib/garlicoind

HEALTHCHECK --start-period=10m CMD su - garlicoind -c 'garlicoin-cli getblocktemplate'
