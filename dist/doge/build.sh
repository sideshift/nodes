#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=1.14.0

docker build \
  --tag sideshift/nodes-doge-$NODE_VERSION \
  --tag sideshift/nodes-doge \
  --build-arg NODE_VERSION \
  .

