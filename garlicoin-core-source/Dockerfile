FROM debian:sid

RUN groupadd -r garlicoind && useradd -r -g garlicoind -d /var/lib/garlicoind garlicoind
RUN install -d -m 0700 -o garlicoind -g garlicoind /var/lib/garlicoind

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates curl git build-essential pkg-config \
        automake autoconf libtool \
        gpg gpg-agent dirmngr \
        libssl-dev libevent-dev \
        libboost-dev libboost-system-dev \
        libboost-thread-dev libboost-filesystem-dev \
        libboost-program-options-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.6/gosu-$(dpkg --print-architecture)" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.6/gosu-$(dpkg --print-architecture).asc" \
    && mkdir ~/.gnupg && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 DC025394180D2FE2 63907B09038FD87B \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

RUN cd /usr/src \
    && git clone 'https://github.com/nuc1e4r5n4k3/garlicoin-core/'

ARG TAG=undefined
COPY *.patch /tmp/
RUN cd /usr/src/garlicoin-core \
    && git fetch \
    && git verify-tag ${TAG} \
    && git checkout ${TAG} \
    && patch -p1 < /tmp/increase-blocksize-reservations.patch \
    && patch -p1 < /tmp/increase-max-connections.patch \
    && rm -f /tmp/*.patch

RUN cd /usr/src/garlicoin-core \
    && autoreconf --install --force --warnings=all


