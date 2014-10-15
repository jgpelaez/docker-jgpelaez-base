#
# https://github.com/jgpelaez/docker-jbossas-7.git
# 
FROM debian:wheezy

MAINTAINER Juan Carlos Garcia Pelaez <juancarlosgpelaez@gmail.com>

RUN \
	apt-get update && \
	apt-get install curl php5-curl wget && \
	mkdir -p /opt && \
    chmod a+r /opt

# TODO remove user and password
WORKDIR /u01/
RUN wget   https://webgate.ec.europa.eu/CITnet/nexus/content/groups/public/com/oracle/weblogic/weblogic-server-installer/12.1.2-0-0/weblogic-server-installer-12.1.2-0-0.zip  && \
  useradd -b /u01 -m -s /bin/bash oracle && \
  echo oracle:welcome1 | chpasswd && \
  chown oracle:oracle -R /u01 
  
# USER oracle

RUN unzip /u01/weblogic-server-installer-12.1.2-0-0.zip -d /u01/oracle/ && \
  rm /u01/weblogic-server-installer-12.1.2-0-0.zip  

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV MW_HOME /u01/oracle/wls12120

WORKDIR /u01/oracle/wls12120
RUN sh configure.sh -silent
ENV CONFIG_JVM_ARGS -Djava.security.egd=file:/dev/./urandom
