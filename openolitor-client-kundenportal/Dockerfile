FROM debian:buster

ENV PACKAGE openolitor-client-kundenportal
ENV USER openolitor
# use tag
# ENV VERSION 2.3.2
# use latest prod branch
ENV VERSION prod
ENV ENVIRONMENT dev
ENV BUILDDATE MYBUILDDATE
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install gnupg vim git wget curl iproute2 netcat-openbsd npm && \
    rm -rf /var/lib/apt/lists/*

RUN npm install npm@latest -g && \
    npm install -g grunt-cli bower

RUN groupadd -g 2000 ${USER} && useradd -u 2000 -g 2000 -m -s /bin/bash -d /opt/${PACKAGE} ${USER} && \
    chown -R ${USER}:${USER} /opt/${PACKAGE}

RUN cd /opt && \
    curl -L https://github.com/OpenOlitor/${PACKAGE}/archive/${VERSION}.tar.gz | tar xz && \
    rm -rf /opt/${PACKAGE} && \
    mv /opt/${PACKAGE}-${VERSION} /opt/${PACKAGE}

COPY run.sh /

RUN chown -R ${USER}:${USER} /opt/${PACKAGE} /run.sh

USER ${USER}

RUN cd /opt/${PACKAGE} && \
    npm install

# settings
## listen not only on localhost
RUN sed -i "s/hostname:.*/hostname: '0.0.0.0',/g" /opt/${PACKAGE}/Gruntfile.js

EXPOSE 9000

USER ${USER}
WORKDIR /opt/${PACKAGE}
ENTRYPOINT ["/usr/bin/env", "/run.sh"]
