#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.17.1

docker build \
  --tag sideshift/nodes-litecoin-$NODE_VERSION \
  --tag sideshift/nodes-litecoin \
  --build-arg NODE_VERSION \
  .

