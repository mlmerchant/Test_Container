#!/bin/bash
# Start nginx in the background
nginx &

# Get the process ID of the last background command
NGINX_PID=$!

while true; do
  if [[ -z ${OPTIONS} ]]; then
    # If OPTIONS is not set, exit while.
    break
  fi
  if [[ "${SIMULATE_FAILURE}" == "true" ]]; then
    # If the SIMULATE_FAILURE environment variable is set to true,
    # sleep for a while, then kill the nginx process
    # then wait forever, to simulate a hung process
    sleep "${FAILURE_TIME}"
    kill -9 $NGINX_PID
    tail -f /dev/null
  fi
  if [[ -n "${COLOR}" ]]; then
    # Change background-color: white to the specified
    sed -i "s/background-color: white/background-color: ${COLOR}/" /usr/share/nginx/html/index.html
  fi
  if [[ "${READY_FILE}" == "true" ]]; then
    # Simulate dropping a ready file after some preprocessing / warm up time.
    sleep "${READY_TIME}"
    touch /opt/ready_file
  fi
  # Sleep for a bit before checking again
  sleep 5
done

# Restart nginx so that it keeps the shell open, unless it crashes.
kill -9 $NGINX_PID
nginx