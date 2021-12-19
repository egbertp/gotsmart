FROM alpine:3.14 as ca
RUN apk add -U --no-cache ca-certificates

################################################

FROM golang:1.17.2 AS builder
# RUN apk update && apk add git
COPY . /go/src/github.com/egbertp/gotsmart
WORKDIR /go/src/github.com/egbertp/gotsmart
ENV CGO_ENABLED 0
RUN go get ./...
RUN go vet ./... && \
    go test ./... && \
    go build

################################################

FROM scratch as final

# Global CA certificates needed to communicate with Microsoft Azure services
COPY --from=ca /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
# Copy artifact from builder
COPY --from=builder /go/src/github.com/egbertp/gotsmart/gotsmart \
    /usr/local/bin/gotsmart

EXPOSE 8080

ENTRYPOINT [ "/usr/local/bin/gotsmart" ]
CMD [ "-device", "/dev/ttyUSB0" ]