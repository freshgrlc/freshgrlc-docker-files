FROM node:8

ARG GIT_REPO=
RUN cd /usr/src && git clone ${GIT_REPO} freshgarlicblocks-pool

ADD daemon-no-getinfo.patch /usr/src/freshgarlicblocks-pool
WORKDIR /usr/src/freshgarlicblocks-pool

RUN sed -i.old 's/"bignum".*$/"bignum": "^0.13.1",/' package.json && \
    sed -i.old 's/"redis".*$/"redis": "^2.8.0",/' package.json && \
    sed -i.old 's/git:/https:/' package.json
RUN npm install || npm install
RUN ./apply_patch.sh
RUN patch -p1 < daemon-no-getinfo.patch

CMD [ "node", "pool.js" ]

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
