FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy uwsgi pycrypto base58 pycryptodome

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-wallet' \
    && cd /usr/src/freshgrlc-wallet \
    && git submodule update --init -f

RUN cd /usr/src/freshgrlc-wallet \
    && git fetch \
    && git checkout 2f72017ec59bafe96c4350a8951d5a1176d88050 \
    && git submodule update --init -f

WORKDIR /usr/src/freshgrlc-wallet
COPY indexer-config.py  indexer/config.py
COPY wallet-config.py  config.py
