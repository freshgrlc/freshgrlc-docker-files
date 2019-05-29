FROM nginx:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
        certbot apache2-utils \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

RUN sed -i.bak 's/user  nginx;/user  root;/' /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/nginx.conf.bak /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/default_blank
RUN touch /var/www/default_blank/index.html

COPY nginx-certbot.conf /etc/nginx/conf.d/certbot.conf

RUN mkdir -p /var/lib/certbot

EXPOSE 80 81
STOPSIGNAL SIGTERM
CMD ["nginx", "-g", "daemon off;"]


