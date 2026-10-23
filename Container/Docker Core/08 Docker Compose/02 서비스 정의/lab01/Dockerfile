# syntax=docker/dockerfile:1

# stage01: base
FROM alpine:3.24 AS base

WORKDIR /app

COPY print-env.sh ./

# stage02: dev
FROM base AS dev

ENV APP_ENV=dev

CMD ["sh", "print-env.sh"]

# stage03: prod
FROM base AS prod

ENV APP_ENV=prod

CMD ["sh", "print-env.sh"]
