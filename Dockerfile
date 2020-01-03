FROM alpine as base

RUN apk add curl \
    && curl "https://caddyserver.com/download/linux/amd64?plugins=http.webdav&license=personal&telemetry=off" \
    | tar xz

FROM busybox

COPY --from=base caddy /bin/
COPY Caddyfile ./

VOLUME /data/

EXPOSE 80
CMD [ "caddy" ]
