#!/usr/bin/env bash
set -ex; cd "$(dirname "$0")"

node_name=sideshift-nodes-omni-test

./build.sh
docker stop $node_name || true
docker run -d --rm --name $node_name sideshift/nodes-omni -rpcpassword=password

until docker exec -ti $node_name omnicore-cli -rpcpassword=password getblockchaininfo; do
  sleep 1
done

docker stop $node_name
