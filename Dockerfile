#
# https://github.com/jgpelaez/docker-jgpelaez-base.git
# 
FROM debian:wheezy

MAINTAINER Juan Carlos Garcia Pelaez <juancarlosgpelaez@gmail.com>

RUN \
	apt-get update && \
	apt-get install -y curl php5-curl wget && \
	mkdir -p /opt && \
    chmod a+r /opt

