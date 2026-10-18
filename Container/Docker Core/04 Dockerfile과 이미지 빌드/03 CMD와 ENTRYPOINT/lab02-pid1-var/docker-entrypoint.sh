#!/bin/sh

echo "[ENTRYPOINT] Initialization started."
echo "[ENTRYPOINT] Executing command: $*"

exec "$@"
