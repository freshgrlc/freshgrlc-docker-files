FROM nginx:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

RUN rm -f /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/default_blank
RUN touch /var/www/default_blank/index.html

COPY config/*.conf /etc/nginx/conf.d/
COPY config/*.conf.include /etc/nginx/conf.d/

RUN mkdir -p /etc/nginx/conf.d/ssl
COPY config/ssl/*.conf /etc/nginx/conf.d/ssl/

EXPOSE 80 443
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]

HEALTHCHECK --interval=10s CMD curl -s 'https://freshgrlc.net/' || exit 1
