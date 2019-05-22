FROM debian:sid

RUN groupadd -r garlicoind && useradd -r -g garlicoind -d /var/lib/garlicoind garlicoind
RUN install -d -m 0700 -o garlicoind -g garlicoind /var/lib/garlicoind

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates curl build-essential pkg-config \
        gpg gpg-agent dirmngr \
        libssl-dev libevent-dev \
        libboost-dev libboost-system-dev \
        libboost-thread-dev libboost-filesystem-dev \
        libboost-program-options-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.6/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.6/gosu-$(dpkg --print-architecture).asc" \
    && mkdir ~/.gnupg && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && gpg --batch --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

RUN cd /tmp \
    && curl -o garlicoin-core-src-0.16.0.3.tar.gz -SL 'https://github.com/nuc1e4r5n4k3/garlicoin-core/releases/download/v0.16.0.3/garlicoin-core-src-0.16.0.3.tar.gz' \
    && echo 'b905b19d1fc9fc096c8223fea2169111fe8c2630ef9401ccecb18de1431fb7c2  garlicoin-core-src-0.16.0.3.tar.gz' | sha256sum -c -

RUN cd /tmp \
    && tar xzf garlicoin-core-src-0.16.0.3.tar.gz

COPY increase-blocksize-reservations.patch /tmp/increase-blocksize-reservations.patch
COPY increase-max-connections.patch /tmp/increase-max-connections.patch

RUN cd /tmp/garlicoin-core-0.16.0 \
    && patch -p1 < /tmp/increase-blocksize-reservations.patch \
    && patch -p1 < /tmp/increase-max-connections.patch \
    && rm -f /tmp/*.patch

RUN cd /tmp/garlicoin-core-0.16.0 \
    && ./configure --disable-tests --disable-bench --disable-zmq --disable-wallet \
    && make -j16 \
    && make install

RUN rm -Rf /tmp/garlicoin-core-0.16.0

VOLUME /var/lib/garlicoind
