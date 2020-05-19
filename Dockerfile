FROM ubuntu:xenial

# set version label
ARG BUILD_DATE
ARG VERSION
ARG CODE_RELEASE
LABEL build_version="Docker-DevEnvironment version ${VERSION}"
LABEL maintainer="RookieKiwi"

# environment settings
ENV HOME="/config"

RUN \
 echo "**** install dependencies ****" && \
 apt-get update && \
 apt-get install -y \
	git \
	jq \
	net-tools \
    wget \
	sudo && \
 echo "**** install code-server ****" && \
 cd /tmp && \
 wget https://github.com/cdr/code-server/archive/v3.3.1.tar.gz -O code.tar.gz && \
 mkdir -p /app/ide && \
 tar xzf /tmp/code.tar.gz -C \
	/app/ide --strip-components=1 && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /setup /

# ports and volumes
EXPOSE 21000
