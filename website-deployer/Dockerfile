FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates git gnupg nodejs npm \
    && rm -rf /var/lib/apt/lists/*

RUN gpg --keyserver hkps://pgp.mit.edu --receive-keys 8B42760F04F73EB62A13D62F2C01995BE64D11CF
RUN npm install --global yarn

COPY verify-checkout-latest-tag.sh /usr/local/bin/verify-checkout-latest-tag
COPY do-build.sh /usr/local/bin/do-build
COPY loop.sh /loop.sh

RUN mkdir -p "/var/auto-deploy"
WORKDIR "/usr/src"

RUN git clone 'https://github.com/freshgrlc/freshgrlc-explorer' \
    && cd freshgrlc-explorer \
    && git checkout $(git tag -l --sort=-v:refname | tail -n1)

CMD ["/loop.sh"]


