FROM debian:stretch-slim

ARG CURRENCY
ARG BACKEND_VERSION
ARG BLOCKBOOK_VERSION

RUN apt-get update -y && apt-get install -y apt-utils && apt-get install -y curl

ADD ./builds/${BACKEND_VERSION}   /tmp/be.deb
ADD ./builds/${BLOCKBOOK_VERSION} /tmp/bb.deb

RUN apt install -y /tmp/be.deb
RUN apt install -y /tmp/bb.deb
RUN rm -f /tmp/be.deb /tmp/bb.deb

RUN apt-get install -y supervisor

ADD ./configs/${CURRENCY}.conf   /opt/coins/nodes/${CURRENCY}/${CURRENCY}.conf
ADD ./configs/blockchaincfg.json /opt/coins/blockbook/${CURRENCY}/config/blockchaincfg.json

ADD ./supervisord/supervisord.conf      /etc/supervisor/supervisord.conf
ADD ./supervisord/conf.d/blockbook.conf /etc/supervisor/conf.d/blockbook.conf
ADD ./supervisord/conf.d/backend.conf   /etc/supervisor/conf.d/backend.conf

#RUN apt-get install -y nano mc procps net-tools

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]