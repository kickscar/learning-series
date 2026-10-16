# syntax=docker/dockerfile:1

FROM alpine:3.24

# Copy the script and grant execution permission
COPY once-worker.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/once-worker.sh

# Set the script as the main process (PID 1)
CMD ["/usr/local/bin/once-worker.sh"]
