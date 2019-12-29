FROM busybox as base

RUN wget "https://caddyserver.com/download/linux/amd64?plugins=http.webdav&license=personal&telemetry=off" -O - | \
    tar xz

FROM busybox

COPY --from=base caddy /bin/
COPY Caddyfile ./

VOLUME /data

EXPOSE 80
CMD [ "caddy" ]
