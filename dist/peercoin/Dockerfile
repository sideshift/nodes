FROM ubuntu:18.04

# System
RUN apt-get update -qq \
  && apt-get install -qq --no-install-recommends ca-certificates wget  unzip \
  && rm -rf /var/lib/apt/lists/*

ARG NODE_VERSION
ENV NODE_PREFIX=peercoin
ENV NODE_FILENAME $NODE_PREFIX-$NODE_VERSION-x86_64-linux-gnu.tar.gz
ENV NODE_URL https://github.com/peercoin/peercoin/releases/download/v${NODE_VERSION}ppc/peercoin-v${NODE_VERSION}ppc-linux-gitian.zip

# Node
RUN set -ex \
  && wget -qO $NODE_FILENAME $NODE_URL \
  && unzip *.tar.gz -d $NODE_PREFIX-$NODE_VERSION \
  && mv $NODE_PREFIX-*/bin/64/peercoind /bin \
  && rm -rf $NODE_PREFIX-* \
  && which peercoind

VOLUME /data
EXPOSE 9902 9901
ENTRYPOINT ["/bin/peercoind", "-datadir=/data", "--printtoconsole", "-rpcallowip=::/0"]

