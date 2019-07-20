#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.15.2

docker build \
  --tag sideshift/nodes-via-$NODE_VERSION \
  --tag sideshift/nodes-via \
  --build-arg NODE_VERSION \
  .

