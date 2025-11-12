#
# Dockerfile for openrefine
#

FROM mcr.microsoft.com/openjdk/jdk:21-ubuntu
MAINTAINER EasyPi Software Foundation

ARG OPENREFINE_VERSION
ARG OPENREFINE_FILE=openrefine-linux-${OPENREFINE_VERSION:?}.tar.gz
ARG OPENREFINE_URL=https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}

RUN set -xe \
 && apt update \
 && apt install -y curl procps \
 && mkdir -p /opt/openrefine \
 && cd /opt/openrefine \
 && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1 \
 && rm -rf /var/lib/apt/lists/*

ENV REFINE_INTERFACE=0.0.0.0
ENV REFINE_PORT=3333
ENV REFINE_DATA_DIR=/data
ENV REFINE_MIN_MEMORY=256M
ENV REFINE_MEMORY=1024M

VOLUME $REFINE_DATA_DIR
WORKDIR $REFINE_DATA_DIR
EXPOSE $REFINE_PORT

ENTRYPOINT ["/opt/openrefine/refine"]
