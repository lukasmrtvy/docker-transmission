FROM alpine:latest

ENV user=admin
ENV password=admin

RUN apk add --update --no-cache \
    transmission-daemon gettext

RUN mkdir -p /transmission/downloads \
  && mkdir -p /transmission/incomplete 
  
ADD settings.json /transmission/

RUN cat .env /transmission/settings.json | envsubst > /transmission/settings.json

VOLUME ["/etc/transmission-daemon"]
VOLUME ["/transmission/downloads"]
VOLUME ["/transmission/incomplete"]

EXPOSE 9091 51413/tcp 51413/udp

CMD exec /usr/bin/transmission-daemon --foreground  --config-dir  /transmission/

