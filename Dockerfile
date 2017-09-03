FROM alpine:latest

ENV rpc_username=admin
ENV rpc_password=admin

RUN apk add --update --no-cache \
    transmission-daemon gettext
    
RUN mkdir -p /transmission/downloads /transmission/incomplete /transmission/conf 

COPY settings.json /transmission/conf/settings.json.template

RUN cat /transmission/conf/settings.json.template | envsubst > /transmission/conf/settings.json && rm /transmission/conf/settings.json.template

VOLUME ["/transmission/conf"]
VOLUME ["/transmission/downloads"]
VOLUME ["/transmission/incomplete"]

EXPOSE 9091 51413/tcp 51413/udp

CMD exec /usr/bin/transmission-daemon --foreground  --config-dir /transmission/conf

