FROM debian:sid

RUN groupadd -r garlicoind && useradd -r -g garlicoind -d /var/lib/garlicoind garlicoind
RUN install -d -m 0700 -o garlicoind -g garlicoind /var/lib/garlicoind

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates curl build-essential pkg-config \
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
    && gpg --batch --keyserver hkps://keyserver.ubuntu.com --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

RUN cd /tmp \
    && curl -o garlicoin-core-src-0.16.1.tar.gz -SL 'https://github.com/nuc1e4r5n4k3/garlicoin-core/releases/download/v0.16.1.1/garlicoin-core-src-0.16.1.tar.gz' \
    && echo '7840c7bcb661b3793906201d13cf18d22396ff9a075bb06f101445bc25747f2d  garlicoin-core-src-0.16.1.tar.gz' | sha256sum -c - \
    && tar xzf garlicoin-core-src-0.16.1.tar.gz \
    && rm -Rf garlicoin-core-src-0.16.1.tar.gz

COPY *.patch /tmp/

RUN cd /tmp/garlicoin-core-0.16.1 \
    && patch -p1 < /tmp/increase-blocksize-reservations.patch \
    && patch -p1 < /tmp/increase-max-connections.patch \
    && rm -f /tmp/*.patch

RUN cd /tmp/garlicoin-core-0.16.1 \
    && autoreconf --install --force --warnings=all


