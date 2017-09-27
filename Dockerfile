FROM alpine:latest

ENV rpc_username=admin
ENV rpc_password=admin

RUN apk add --update --no-cache transmission-daemon 
    
RUN mkdir -p /transmission/downloads /transmission/incomplete /transmission/conf 

VOLUME ["/transmission/conf"]
VOLUME ["/transmission/downloads"]
VOLUME ["/transmission/incomplete"]

EXPOSE 9091 51413/tcp 51413/udp

CMD transmission-daemon --foreground  --auth --username ${rpc_username} --password ${rpc_password} --allowed "*" --download-dir /transmission/downloads --incomplete-dir  /transmission/incomplete --config-dir /transmission/conf
