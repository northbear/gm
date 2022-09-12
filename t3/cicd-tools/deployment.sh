#!/usr/bin/env bash

if [[ ! -v DEPLOY_ENV ]]; then
    echo "*** Delivery skipped ***"
    echo "A delivery destination (envvar DEPLOY_ENV) is not defined"
    exit 0
fi

DEPLOY_SOURCE=${1}

cd "${PROJECT_DIR}"

if [[ -f "${DEPLOY_SOURCE}" ]]; then
    echo "The file ${DEPLOY_SOURCE} is deployed to the environment ${DEPLOY_ENV}"
elif [[ -d "${DEPLOY_SOURCE}" ]]; then
    echo "A content of the directory ${DEPLOY_SOURCE} is deployed to the environment ${DEPLOY_ENV}"
else
    echo "Error: incorrect parameter are provided. The directory or the file ${DEPLOY_SOURCE} doesn't exist"
    exit 1
fi
