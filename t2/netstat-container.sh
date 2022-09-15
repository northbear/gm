#!/usr/bin/env bash

# set -xv

BASE_DIR=$(cd `dirname $0`; pwd )

IMAGE_NAME=netstat-scanner:0.0.1
CONTAINER_NAME=netstat-scanner

build() {
    docker build --rm -t "${IMAGE_NAME}" .
}

start() {
    docker run \
           --name ${CONTAINER_NAME} \
           --network host \
           --cap-add CAP_SYS_ADMIN \
           -v "${BASE_DIR}"/data:/mnt/data \
           -it \
           "${IMAGE_NAME}"
}

rm() {
    docker container rm ${CONTAINER_NAME}
}

"$*"
