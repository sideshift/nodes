#!/usr/bin/env bash
set -e
set -o pipefail

for name in bitcoin-sv peercoin bitcoin-abc via bitcoin litecoin omni dash; do
  mkdir -p dist/$name
  ./scripts/compile-ejs.sh Dockerfile-bitcoin $name/settings > dist/$name/Dockerfile
  ./scripts/compile-ejs.sh build.sh $name/settings > dist/$name/build.sh
  ./scripts/compile-ejs.sh test.sh $name/settings > dist/$name/test.sh
  chmod +x dist/$name/*.sh
done
