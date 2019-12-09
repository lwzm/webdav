FROM alpine as base

RUN wget -O _ "https://caddyserver.com/download/linux/amd64?plugins=http.webdav&license=personal&telemetry=off" \
    && tar xf _

FROM busybox

COPY --from=base caddy /bin/
COPY Caddyfile ./

VOLUME /data

EXPOSE 80
CMD [ "caddy" ]
