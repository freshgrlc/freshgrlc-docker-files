FROM python:2

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer' \
    && cd /usr/src/freshgrlc-indexer \
    && git submodule update --init -f

WORKDIR /usr/src/freshgrlc-indexer

RUN cd coinsupport && pip install -r requirements-python2.txt
RUN pip install -r requirements.txt

RUN    cd /tmp \
    && git clone 'https://github.com/fiatjaf/bech32' \
    && cd bech32 \
    && git checkout bbc84e572aa863ea0cbacf973b726928f64bebc3 \
    && cp -a bech32 /usr/src/freshgrlc-indexer/bech32 \
    && cd /tmp \
    && rm -Rf bech32

ENV GNUPGHOME=/usr/src/freshgrlc-indexer/.gnupg
RUN gpg --keyserver hkps://pgp.key-server.io --receive-keys DC025394180D2FE2

ARG TAG=undefined

RUN    git fetch \
    && git verify-tag ${TAG} \
    && git checkout ${TAG} \
    && git submodule update --init -f

RUN cd coinsupport && pip install -r requirements-python2.txt
RUN pip install -r requirements.txt
