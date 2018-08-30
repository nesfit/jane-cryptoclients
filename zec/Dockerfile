FROM ubuntu:16.04

VOLUME ["/root/.zcash"]

RUN apt-get update \
    && apt-get install -y aptitude apt-transport-https less nano wget

RUN wget -qO - https://apt.z.cash/zcash.asc | apt-key add -
RUN echo "deb https://apt.z.cash/ jessie main" | tee /etc/apt/sources.list.d/zcash.list

RUN apt-get update \
    && apt-get install -y zcash \
    && rm -rf /var/lib/apt/lists/*

RUN zcash-fetch-params

WORKDIR /root

ENTRYPOINT ["zcashd"]