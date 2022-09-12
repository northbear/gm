#!/usr/bin/env bash

# set -xv

BASE_DIR=$( cd `dirname $0`; pwd )

COMMAND_NAME=$(basename $0)
PID_FILE="/tmp/${COMMAND_NAME}.pid"

terminate() {
    echo "${COMMAND_NAME} is terminating"
    [[ -f "${PID_FILE}" ]] && rm "$PID_FILE"
    exit 0
}

trap terminate SIGTERM

echo "$$" > "${PID_FILE}"
echo "${COMMAND_NAME} PID: $$"

while true; do
    sleep 1
done
