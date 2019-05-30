FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy uwsgi

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer'

RUN cd /usr/src/freshgrlc-indexer \
    && git fetch \
    && git checkout 9b528ac4b57fd3e487d4f2971b3e7b73159f6187

WORKDIR /usr/src/freshgrlc-indexer



