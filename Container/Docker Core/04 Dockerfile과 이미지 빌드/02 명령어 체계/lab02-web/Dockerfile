# syntax=docker/dockerfile:1

FROM nginx:1.30

HEALTHCHECK --interval=5s --timeout=3s --retries=2 \
  CMD curl -fs http://localhost/ > /dev/null || exit 1
