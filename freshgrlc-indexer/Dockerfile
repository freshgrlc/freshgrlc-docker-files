FROM python:2

RUN pip install --no-cache-dir cachetools Flask Flask-Cors gevent greenlet PyMySQL python-bitcoinrpc requests SQLAlchemy

RUN cd /usr/src \
    && git clone 'https://github.com/freshgrlc/freshgrlc-indexer'

RUN cd /usr/src/freshgrlc-indexer \
    && git fetch \
    && git checkout 327301ca093d453ed7b288455a1865e2433b70c2

WORKDIR /usr/src/freshgrlc-indexer

CMD [ "python", "indexer.py" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

