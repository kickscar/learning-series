# Dockerfile

FROM alpine:latest

# Copy the script and grant execution permission
COPY dummy-worker.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/dummy-worker.sh

# Set the script as the main process (PID 1)
CMD ["/usr/local/bin/dummy-worker.sh"]