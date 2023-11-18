FROM busybox as base

RUN wget https://github.com/hacdias/webdav/releases/download/v4.2.0/linux-amd64-webdav.tar.gz -O - | tar xz

FROM busybox
LABEL maintainer="lwzm@qq.com"

ENV WD_AUTH=false WD_MODIFY=true WD_PORT=80 WD_SCOPE=/data
EXPOSE 80
VOLUME /data
CMD [ "webdav" ]

COPY --from=base /webdav /bin/
