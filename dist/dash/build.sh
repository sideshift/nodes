#!/usr/bin/env bash
cd "$(dirname "$0")"; set -e

export NODE_VERSION=0.14.0.2

docker build \
  --tag sideshift/nodes-dash-$NODE_VERSION \
  --tag sideshift/nodes-dash \
  --build-arg NODE_VERSION \
  .

