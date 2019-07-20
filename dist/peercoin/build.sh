#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.7.3

docker build \
  --tag sideshift/nodes-peercoin-$NODE_VERSION \
  --tag sideshift/nodes-peercoin \
  --build-arg NODE_VERSION \
  .

