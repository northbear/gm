#!/usr/bin/env bash

if [[ ! -v DELIVERY_DEST ]]; then
    echo "*** Delivery skipped ***"
    echo "A delivery destination (envvar DELIVERY_DEST) is not defined"
    exit 0
fi

DELIVERY_SOURCE=${1}

if [[ -f "${DELIVERY_SOURCE}" ]]; then
    echo "The file ${DELIVERY_SOURCE} is pushed to repository ${DELIVERY_DEST}"
elif [[ -d "${DELIVERY_SOURCE}" ]]; then
    echo "A content of the directory ${DELIVERY_SOURCE} is pushed to repository ${DELIVERY_DEST}"
else
    echo "Error: incorrect parameter are provided. The directory or the file ${DELIVERY_SOURCE} doesn't exist"
    exit 1
fi
