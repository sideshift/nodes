#!/usr/bin/env bash
set -e; cd "$(dirname "$0")"

node_name=sideshift-nodes-doge-test

./build.sh
docker stop $node_name || true
docker run -d --rm --name $node_name sideshift/nodes-doge -rpcpassword=password

until docker exec -ti $node_name dogecoin-cli -rpcpassword=password getblockchaininfo; do
  sleep 1
done

docker stop $node_name

