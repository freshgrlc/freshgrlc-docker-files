FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy uwsgi

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer'

RUN cd /usr/src/freshgrlc-indexer \
    && git fetch \
    && git checkout 777acf874220db5145b29b1335235f9a537b0d69

WORKDIR /usr/src/freshgrlc-indexer



