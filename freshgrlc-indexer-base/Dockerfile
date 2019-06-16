FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy uwsgi

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer'

WORKDIR /usr/src/freshgrlc-indexer
ENV GNUPGHOME=/usr/src/freshgrlc-indexer/.gnupg

RUN gpg --receive-keys 8B42760F04F73EB62A13D62F2C01995BE64D11CF

ARG TAG=undefined

RUN    git fetch \
    && git verify-tag ${TAG} \
    && git checkout ${TAG}

