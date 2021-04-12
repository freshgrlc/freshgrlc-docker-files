FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy uwsgi base58

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer'

WORKDIR /usr/src/freshgrlc-indexer
ENV GNUPGHOME=/usr/src/freshgrlc-indexer/.gnupg

RUN gpg --keyserver hkps://pgp.mit.edu --receive-keys DC025394180D2FE2

ARG TAG=undefined

RUN    git fetch \
    && git verify-tag ${TAG} \
    && git checkout ${TAG}

