#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.2.1

docker build \
  --tag sideshift/nodes-bitcoin-sv-$NODE_VERSION \
  --tag sideshift/nodes-bitcoin-sv \
  --build-arg NODE_VERSION \
  .

