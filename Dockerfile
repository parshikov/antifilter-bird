FROM ubuntu:latest

MAINTAINER Grigory Parshikov <grisha.mexanik@gmail.com>

LABEL Description="Bird Internet routing daemon with RKN fiter list" Version="0.1.0"

RUN apt-get update && \
    apt-get install -y \
    iputils-ping \
    net-tools \
    lsb-base \
    software-properties-common \
    gpg \
    wget && \
    add-apt-repository ppa:cz.nic-labs/bird && \
    apt-get update && \
    apt-get install bird && \
    apt-get autoclean && \
    apt-get clean

COPY reload /etc/cron.d/reload
COPY blacklist /root/blacklist

# Create volume for configuration files
VOLUME /etc/bird/

# Exposes BGP port by default. Expecify other protocol ports with 'docker run'
EXPOSE 179/tcp

CMD service cron start && service bird start
