FROM golang as base

LABEL maintainer="lwzm@qq.com"

RUN CGO_ENABLED=0 go get -v -ldflags "-s -w" github.com/hacdias/webdav

FROM scratch

ENV WD_AUTH=false WD_MODIFY=true WD_PORT=80 WD_SCOPE=/data
EXPOSE 80
VOLUME /data/
ENTRYPOINT [ "/webdav" ]

COPY --from=base /go/bin/webdav /webdav
