FROM ubuntu:latest

RUN apt-get -qq update && \
    apt-get upgrade -y && \
    apt-get --no-install-recommends -yq install \
    automake libtool make gcc \
    flex bison autoconf libssl-dev libmagic-dev

ADD ./yara /src/yara
WORKDIR /src/yara/
RUN ./bootstrap.sh && \
    ./configure --enable-magic --with-crypto && \
    make && \
    make install && \
    echo "/usr/local/lib" >> /etc/ld.so.conf && \
    ldconfig

WORKDIR /srv/
