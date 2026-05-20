#!/bin/sh
# dummy-worker.sh
# Acts like a typical server process: prints startup message and waits forever.

echo "--- Dummy Worker Service Initializing ---"
echo "Service is now running as PID 1 and will remain active until explicitly stopped."
echo "Ready to practice 'pause', 'unpause', 'stop', and 'restart'."

# The main process (PID 1) is switched to an indefinite wait state.
# This keeps the container "Up" without constantly logging.
exec tail -f /dev/null