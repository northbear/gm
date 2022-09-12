#!/usr/bin/env bash

# set -xv

BASE_DIR=$( cd `dirname $0`; pwd )

if [[ ! -v PROJECT_REPO ]]; then
    echo "Error: The project git repository (envvar PROJECT_REPO) is not defined. Cannot continue"
    exit 1
fi
GIT_REPO=${PROJECT_REPO}

git clone "${GIT_REPO}"
