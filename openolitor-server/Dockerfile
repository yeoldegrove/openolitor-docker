FROM openjdk:8-jre-slim-buster

ENV PACKAGE openolitor-server
ENV USER openolitor
# use tag
# ENV VERSION 2.3.2
# use latest prod branch
ENV VERSION prod
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install apt-transport-https gnupg vim git wget curl && \
    apt-get -y install iproute2 netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && \
    # fix bug with non-existing man folder && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -y install sbt scala && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 2000 ${USER} && useradd -u 2000 -g 2000 -m -s /bin/bash -d /opt/${PACKAGE} ${USER} && \
    chown -R ${USER}:${USER} /opt/${PACKAGE}

RUN cd /opt && \
    curl -L https://github.com/OpenOlitor/${PACKAGE}/archive/${VERSION}.tar.gz | tar xz && \
    rm -rf /opt/${PACKAGE} && \
    mv /opt/${PACKAGE}-${VERSION} /opt/${PACKAGE} && \
    chown -R ${USER}:${USER} /opt/${PACKAGE}

USER ${USER}
RUN cd /opt/${PACKAGE} && \
    echo "-J-Dsbt.io.jdktimestamps=true" >>/opt/${PACKAGE}/.sbtopts && \
    sbt clean package

EXPOSE 9003
EXPOSE 9004
EXPOSE 9005

USER ${USER}
WORKDIR /opt/${PACKAGE}
ENTRYPOINT ["/usr/bin/env", "sbt", "run"]
