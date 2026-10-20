# syntax=docker/dockerfile:1

# stage01: build
FROM golang:1.27-alpine AS build

WORKDIR /src

COPY main.go ./
RUN go build -o /out/hello main.go

# stage02: test
FROM build AS test

RUN go vet main.go

# stage03: runtime
FROM alpine:3.24 AS runtime

WORKDIR /app

COPY --from=build /out/hello ./

CMD ["./hello"]
