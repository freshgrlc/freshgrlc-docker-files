FROM garlicoin-core-base:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        cmake \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    git clone https://github.com/nlohmann/json nlohmann_json && \
    mkdir nlohmann_json/build && \
    cd nlohmann_json/build && \
    git checkout e7b3b40b5a95bc74b9a7f662830a27c49ffc01b4 && \
    cmake .. && \
    make -j$(nproc) && \
    make install && \
    cd /tmp && \
    rm -Rf nlohmann_json

RUN cd /tmp && \
    git clone https://github.com/freshgrlc/freshgrlc-pool && \
    mkdir freshgrlc-pool/build && \
    cd freshgrlc-pool/build && \
    cmake .. && \
    make -j$(nproc) && \
    make install

WORKDIR /tmp/freshgrlc-pool
CMD [ "build/pool/pool" ]
HEALTHCHECK NONE

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 3032
