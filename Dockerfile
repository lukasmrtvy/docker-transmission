FROM alpine:latest

RUN apk add --update --no-cache \
    transmission-daemon 

RUN mkdir -p /transmission/downloads \
  && mkdir -p /transmission/incomplete 
  
ADD settings.json /transmission/

VOLUME ["/etc/transmission-daemon"]
VOLUME ["/transmission/downloads"]
VOLUME ["/transmission/incomplete"]

EXPOSE 9091 51413/tcp 51413/udp

CMD exec /usr/bin/transmission-daemon --foreground  --config-dir  /transmission/

