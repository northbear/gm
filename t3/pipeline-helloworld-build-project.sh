#!/usr/bin/env bash

# set -xv

## The Project/pipeline parameter definitions
export PROJECT_REPO="https://github.com/northbear/gm.git"
export PROJECT_DIR="gm/t3/helloworld"
export DELIVERY_DEST="https://artifactory.gm.corp/helloworld-application/"
export DEPLOY_ENV="qa-test-environment"

## List of parameters exported to a container
VAR_EXPORT_LIST='PROJECT_REPO|PROJECT_DIR|DELIVERY_DEST|DEPLOY_ENV'

## Should be defined by CI/CD environment
export JOB_NAME=hw-pipeline
export BUILD_NUMBER=001
export CONTAINER_NAME="${JOB_NAME}-${BUILD_NUMBER}"

export CONTAINER_ENV_FILE="/tmp/${CONTAINER_NAME}.env"
export BUILDER_IMAGE="ubuntu-builder:0.0.1"

echo    "Container environment file: ${CONTAINER_ENV_FILE}"
printenv | grep -E "${VAR_EXPORT_LIST}" > "${CONTAINER_ENV_FILE}"
echo -e "Container environment content: \n$( cat ${CONTAINER_ENV_FILE} )"

CONTAINER_ID=$(
    docker run -d --env-file ${CONTAINER_ENV_FILE} --rm --name ${CONTAINER_NAME} ${BUILDER_IMAGE}
)

echo "Container name: ${CONTAINER_NAME}"
echo "Container ID: ${CONTAINER_ID}"

echo "*** GET SOURCE CODE   ***"
docker exec --env-file ${CONTAINER_ENV_FILE} ${CONTAINER_NAME} git-checkout.sh
echo "*** BUILD APPLICATION ***"
docker exec --env-file ${CONTAINER_ENV_FILE} ${CONTAINER_NAME} build-project.sh
echo "*** PACKAGE DELIVERY  ***"
docker exec --env-file ${CONTAINER_ENV_FILE} ${CONTAINER_NAME} delivery.sh   build/
echo "*** DEPLOYMENT TO ENV ***"
docker exec --env-file ${CONTAINER_ENV_FILE} ${CONTAINER_NAME} deployment.sh build/
echo "*** CONTAINER TERMINATION ***"
docker exec --env-file ${CONTAINER_ENV_FILE} ${CONTAINER_NAME} container-terminate.sh
