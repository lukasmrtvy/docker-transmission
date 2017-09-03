FROM alpine:latest

ENV rpc-username=admin
ENV rpc-password=admin

RUN apk add --update --no-cache \
    transmission-daemon gettext

RUN mkdir -p /transmission/{downloads,incomplete,conf} 
  
ADD settings.json /etc/transmission-daemon

# RUN cat /transmission/settings.json | envsubst > /transmission/settings.json

VOLUME ["/etc/transmission-daemon"]
VOLUME ["/transmission/downloads"]
VOLUME ["/transmission/incomplete"]

EXPOSE 9091 51413/tcp 51413/udp

CMD exec /usr/bin/transmission-daemon --foreground  --config-dir /etc/transmission-daemon

