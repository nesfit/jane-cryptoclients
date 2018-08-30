FROM debian:stable-slim

RUN useradd -r bitcoin \
  && apt-get update -y \
  && apt-get install -y curl gnupg unzip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && set -ex 
  
#  && for key in \
#    B42F6819007F00F88E364FD4036A9C25BF357DD4 \
# ; do \
#    gpg --keyserver pgp.mit.edu --recv-keys "$key" || \
#    gpg --keyserver keyserver.pgp.com --recv-keys "$key" || \
#    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
#    gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" ; \
# done

ENV GOSU_VERSION=1.10

RUN curl -o /usr/local/bin/gosu -fSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture) \
  && curl -o /usr/local/bin/gosu.asc -fSL https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture).asc \
#  && gpg --verify /usr/local/bin/gosu.asc \
  && rm /usr/local/bin/gosu.asc \
  && chmod +x /usr/local/bin/gosu

ENV BITCOIN_VERSION=0.16.2
#ENV BITCOIN_SHASUM="eccf8b61ba0549f6839e586c7dc6fc4bf6d7591ac432aaea8a7df0266b113d27  bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz"
ENV BITCOIN_PREFIX=/opt/bitcoin-${BITCOIN_VERSION}
ENV BITCOIN_DATA=/home/bitcoin/.bitcoin
ENV PATH=/opt/bitcoin-${BITCOIN_VERSION}/bin:$PATH

RUN curl -SLO https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz \
#  && echo "${BITCOIN_SHASUM}" | sha256sum -c \
  && tar -xzf *.tar.gz -C /opt \
  && rm *.tar.gz

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME ["/home/bitcoin/.bitcoin"]

EXPOSE 8332 8333 18332 18333 18444

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bitcoind"]
