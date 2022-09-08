FROM golang:1.18 as buildimage

COPY morse-responder /go/src/morse-responder
RUN  cd /go/src/morse-responder; go build
RUN  ls -l /go/src/morse-responder

FROM ununtu:20.04

ENV APP_PORT=8081
COPY --from=buildimage /go/src/morse-responder/morse-responder .

EXPOSE $APP_PORT
ENTRYPOINT ["./morse-responder"]
