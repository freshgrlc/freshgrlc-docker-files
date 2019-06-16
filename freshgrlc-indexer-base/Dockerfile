FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy uwsgi

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer'

RUN cd /usr/src/freshgrlc-indexer \
    && git fetch \
    && git checkout 008c57a2c4cb9dd44f521e2c31c2b13c0198e394

WORKDIR /usr/src/freshgrlc-indexer



