#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.5.0

docker build \
  --tag sideshift/nodes-omni-$NODE_VERSION \
  --tag sideshift/nodes-omni \
  --build-arg NODE_VERSION \
  .

