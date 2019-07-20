#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.19.10

docker build \
  --tag sideshift/nodes-bitcoin-abc-$NODE_VERSION \
  --tag sideshift/nodes-bitcoin-abc \
  --build-arg NODE_VERSION \
  .

