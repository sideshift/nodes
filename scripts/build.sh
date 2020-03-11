#!/usr/bin/env bash
set -e
set -o pipefail

target_node="${TARGET_NODE:-all}"

for name in zcash groestl doge bitcoin-sv peercoin bitcoin-abc via bitcoin litecoin omni dash liquid monero monero-wrpc monero-wrpc-proxy lnd-bitcoin lnd-bitcoin-proxy hsd; do
  if [[ "$target_node" != "all" && "$target_node" != "$name" ]]; then
    continue
  fi

  echo "Compiling $name..."
  mkdir -p dist/$name

  if [[ "$name" = "monero" ]]; then
    ./scripts/compile-ejs.sh Dockerfile-monero $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-monero.service $name/settings > dist/$name/$name.service
  elif [[ "$name" = "monero-wrpc" ]]; then
    ./scripts/compile-ejs.sh Dockerfile-monero $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-monero-wrpc.service $name/settings > dist/$name/$name.service
  elif [[ "$name" = "monero-wrpc-proxy" ]]; then
    ./scripts/compile-ejs.sh Dockerfile-proxy $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-monero-wrpc-proxy.service $name/settings > dist/$name/$name.service
  elif [[ "$name" = "lnd-bitcoin-proxy" ]]; then
    ./scripts/compile-ejs.sh Dockerfile-proxy $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-lnd-bitcoin-proxy.service $name/settings > dist/$name/$name.service
  elif [[ "$name" = "lnd-bitcoin" ]]; then
    ./scripts/compile-ejs.sh Dockerfile-lnd $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-lnd.service $name/settings > dist/$name/$name.service
  elif [[ "$name" = "c-lightning-bitcoin" ]]; then
    ./scripts/compile-ejs.sh Dockerfile-c-lightning $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-c-lightning.service $name/settings > dist/$name/$name.service
  elif [[ "$name" = "hsd" ]]; then
    ./scripts/compile-ejs.sh Dockerfile-hsd $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-hsd.service $name/settings > dist/$name/$name.service
  else
    ./scripts/compile-ejs.sh Dockerfile-bitcoin $name/settings > dist/$name/Dockerfile
    ./scripts/compile-ejs.sh systemd-bitcoin.service $name/settings > dist/$name/$name.service
    ./scripts/compile-ejs.sh test-bitcoin.sh $name/settings > dist/$name/test.sh
    ./scripts/compile-ejs.sh cli-bitcoin.sh $name/settings > dist/$name/cli.sh
  fi

  ./scripts/compile-ejs.sh build.sh $name/settings > dist/$name/build.sh
  ./scripts/compile-ejs.sh install.sh $name/settings > dist/$name/install.sh

  chmod +x dist/$name/*.sh
done
