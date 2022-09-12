#!/usr/bin/env bash

# set -xv

BASE_DIR=$( cd `dirname $0`; pwd )

PID_FILE="/tmp/container-init.sh.pid"

kill `cat ${PID_FILE}`
