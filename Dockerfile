FROM alpine:3.7

ENV rpc_username=admin
ENV rpc_password=admin

ENV UID 1000
ENV GID 1000
ENV USER htpc
ENV GROUP htpc

ENV TRANSMISSION_VERSION 2.92-r5

RUN addgroup -S ${GROUP} -g ${GID} && adduser -D -S -u ${UID} ${USER} ${GROUP}  && \
    apk add --update --no-cache tzdata transmission-daemon==${TRANSMISSION_VERSION} && \
    mkdir -p /transmission/downloads /transmission/incomplete /transmission/conf  && \
    chown -R ${USER}:${GROUP} /transmission/

VOLUME ["/transmission/conf","/transmission/downloads", "/transmission/incomplete"]

EXPOSE 9091 51413/tcp 51413/udp

LABEL version=${TRANSMISSION_VERSION}
LABEL url=https://github.com/transmission/transmission/

USER ${USER}

CMD transmission-daemon --foreground  --auth --username ${rpc_username} --password ${rpc_password} --allowed "*" --download-dir /transmission/downloads --incomplete-dir  /transmission/incomplete --config-dir /transmission/conf
