FROM node:12

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        ca-certificates git gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN gpg --keyserver hkps://pgp.key-server.io --receive-keys DC025394180D2FE2

COPY verify-checkout-latest-tag.sh /usr/local/bin/verify-checkout-latest-tag
COPY do-build.sh /usr/local/bin/do-build
COPY loop.sh /loop.sh

RUN mkdir -p "/var/auto-deploy"
WORKDIR "/usr/src"

RUN git clone 'https://github.com/freshgrlc/freshgrlc-explorer' \
    && cd freshgrlc-explorer \
    && git checkout $(git tag -l --sort=-v:refname | tail -n1)

RUN git clone 'https://github.com/freshgrlc/freshgrlc-pool-website-legacy' 'freshgrlc-pool-website' \
    && cd freshgrlc-pool-website \
    && git checkout $(git tag -l --sort=-v:refname | tail -n1)

CMD ["/loop.sh"]


