FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy uwsgi

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer'

RUN cd /usr/src/freshgrlc-indexer \
    && git fetch \
    && git checkout 53c87301a0e363148f01b70e4107a5233538d5a3

WORKDIR /usr/src/freshgrlc-indexer



