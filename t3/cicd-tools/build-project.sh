#!/usr/bin/env bash

# set -xv

BASE_DIR=$( cd `dirname $0`; pwd )

COMMAND_NAME=$(basename $0)

if [[ ! -v PROJECT_DIR ]]; then
    echo "Error: The project directory (envvar PROJECT_DIR) is not defined. Cannot continue"
    exit 1
fi
BUILD_DIR=${PROJECT_DIR}

cd ${BUILD_DIR} && make $*
