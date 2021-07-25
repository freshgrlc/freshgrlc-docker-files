FROM docker:latest

RUN apk update && apk add curl

COPY monitor.sh /monitor.sh
CMD ["sh", "/monitor.sh"]
