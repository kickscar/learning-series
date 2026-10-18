# syntax=docker/dockerfile:1

FROM alpine:3.24

COPY message.txt /app/message.txt
RUN wc -c /app/message.txt > /app/size.txt

CMD ["cat", "/app/message.txt", "/app/size.txt"]
