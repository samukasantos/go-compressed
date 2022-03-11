FROM golang:1.11-alpine as builder

WORKDIR /go/src/

COPY hello.go go.* ./
RUN CGO_ENABLED=0 GOOS=linux go build -o -ldflags="-s -w" -a -installsuffix cgo -o app .

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app /