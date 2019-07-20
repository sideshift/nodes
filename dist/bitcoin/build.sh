#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.18.0

docker build \
  --tag sideshift/nodes-bitcoin-$NODE_VERSION \
  --tag sideshift/nodes-bitcoin \
  --build-arg NODE_VERSION \
  .

