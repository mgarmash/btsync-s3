# Dockerfile for btsync with Amazon S3 backend
# based on http://stackoverflow.com/questions/24966347/is-s3fs-not-able-to-mount-inside-docker-container
# and https://github.com/aostanin/dockerfiles
FROM ubuntu:trusty

MAINTAINER Max Garmash <max@garmash.org>

ENV LANG ru_RU.UTF-8
RUN locale-gen $LANG

RUN apt-get update -qq
RUN apt-get install -y build-essential libfuse-dev fuse libcurl4-openssl-dev libxml2-dev mime-support automake libtool wget tar

ADD http://download-new.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /btsync.tar.gz
RUN tar xf /btsync.tar.gz && rm /btsync.tar.gz

ADD start.sh /start.sh

RUN wget https://github.com/s3fs-fuse/s3fs-fuse/archive/v1.78.tar.gz -O /usr/src/v1.78.tar.gz
RUN tar xvz -C /usr/src -f /usr/src/v1.78.tar.gz
RUN cd /usr/src/s3fs-fuse-1.78 && ./autogen.sh && ./configure --prefix=/usr && make && make install

RUN mkdir /s3

VOLUME ["/data"] 
EXPOSE 3369/udp
EXPOSE 8888

CMD ["/start.sh"]
