# syntax=docker/dockerfile:1

FROM alpine:3.24
ARG APP_DIR=/app

WORKDIR ${APP_DIR}

COPY message.txt ./
RUN date +%T > built-at.txt
RUN wc -c message.txt > size.txt

CMD ["cat", "built-at.txt", "size.txt"]
