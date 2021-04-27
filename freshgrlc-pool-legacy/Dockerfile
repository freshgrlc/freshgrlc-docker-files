FROM node:8

ARG GIT_REPO=
RUN cd /usr/src && git clone ${GIT_REPO} freshgarlicblocks-pool

ADD package-lock.json /usr/src/freshgarlicblocks-pool
ADD daemon-no-getinfo.patch /usr/src/freshgarlicblocks-pool
WORKDIR /usr/src/freshgarlicblocks-pool

RUN npm install || npm install
RUN ./apply_patch.sh
RUN patch -p1 < daemon-no-getinfo.patch

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        redis-server \
    && rm -rf /var/lib/apt/lists/*

CMD [ "node", "pool.js" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

ADD tuxcoin.patch /usr/src/freshgarlicblocks-pool
RUN patch -p1 < tuxcoin.patch

