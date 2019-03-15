# Dockerfile example for debian Signal Sciences reverse proxy agent container

FROM ubuntu:xenial
MAINTAINER Signal Sciences Corp.

COPY contrib/sigsci-release.list /etc/apt/sources.list.d/sigsci-release.list
RUN  apt-get update; apt-get install -y apt-transport-https curl ; curl -slL https://apt.signalsciences.net/gpg.key | apt-key add -; apt-get update; apt-get install -y sigsci-agent;  apt-get clean

RUN mkdir /etc/sigsci
COPY contrib/agent.conf /etc/sigsci/agent.conf
COPY contrib/server.crt /etc/sigsci/server.crt
COPY contrib/server.key /etc/sigsci/server.key

COPY start.sh /opt/start.sh
RUN  chmod +x /opt/start.sh

CMD ["/opt/start.sh"]
