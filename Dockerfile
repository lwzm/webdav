FROM golang as base

LABEL maintainer="lwzm@qq.com"

RUN CGO_ENABLED=0 go get -v -ldflags "-s -w" github.com/hacdias/webdav

FROM scratch

COPY --from=base /go/bin/webdav /webdav
VOLUME /data/
ENV WD_PORT=80 WD_AUTH=false WD_MODIFY=true WD_SCOPE=/data
EXPOSE 80
      
ENTRYPOINT [ "/webdav" ]
