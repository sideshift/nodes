#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=2.17.2

docker build \
  --tag sideshift/nodes-groestl-$NODE_VERSION \
  --tag sideshift/nodes-groestl \
  --build-arg NODE_VERSION \
  .

