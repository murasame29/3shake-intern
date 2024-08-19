FROM golang:1.22.5 AS build
WORKDIR /build

COPY . .
ENV CGO_ENABLED=0

RUN go mod download \
&& go build -o /build/main main.go 

FROM gcr.io/distroless/base-debian12
WORKDIR /app

COPY --from=build /build/main /app/main 

USER 1000

CMD ["/app/main"]