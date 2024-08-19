FROM golang:1.22.5 AS build
WORKDIR /build

COPY . .

RUN go mod download \
&& go build -o /build/main cmd/main.go 

FROM gcr.io/distroless/base-debian11
WORKDIR /app

COPY --from=build /build/main /app/main 

USER 1000

CMD ["/app/main"]