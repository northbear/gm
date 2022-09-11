#!/usr/bin/env bash

set -xv

docker build --rm -t ubuntu-builder:0.0.1 -f Dockerfile.ubuntu-builder . 
