#!/bin/sh
# infinite-worker.sh
# Runs indefinitely, logging output every second to maintain the "Up" status.

echo "--- Infinite Worker Started ---"
echo "This process is the main container process (PID 1) and will keep the container Running."
echo "Use 'docker logs [CONTAINER_NAME] -f' to monitor its status."

# Infinite loop to keep the container alive
while true
do
  # Log the current status and time
  echo "Container Status: RUNNING | Uptime Check: $(date)"
  sleep 1
done