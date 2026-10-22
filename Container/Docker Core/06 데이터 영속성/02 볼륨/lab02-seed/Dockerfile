# syntax=docker/dockerfile:1

FROM alpine:3.24

RUN mkdir /data && echo "default setting" > /data/app.conf

VOLUME /data

CMD ["sleep", "3600"]
