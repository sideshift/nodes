FROM ubuntu:18.04

# System
RUN apt-get update -qq \
  && apt-get install -qq --no-install-recommends ca-certificates wget  \
  && rm -rf /var/lib/apt/lists/*

ARG NODE_VERSION
ENV NODE_PREFIX=omnicore
ENV NODE_FILENAME $NODE_PREFIX-$NODE_VERSION-x86_64-linux-gnu.tar.gz
ENV NODE_URL https://github.com/OmniLayer/omnicore/releases/download/v$NODE_VERSION/$NODE_FILENAME

# Node
RUN set -ex \
  && wget -qO $NODE_FILENAME $NODE_URL \
  && tar -xzf *.tar.gz --exclude=*-qt --exclude=*test* \
  && mv $NODE_PREFIX-*/bin/* /bin \
  && rm -rf $NODE_PREFIX-* \
  && which omnicored

VOLUME /data
EXPOSE 8332 8333 18332 18333
ENTRYPOINT ["/bin/omnicored", "-datadir=/data", "--printtoconsole", "-rpcallowip=::/0", "-txindex"]

