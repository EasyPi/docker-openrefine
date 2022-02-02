#
# Dockerfile for openrefine
#

FROM openjdk:17-slim-bullseye
MAINTAINER EasyPi Software Foundation

ARG OPENREFINE_VERSION

ENV OPENREFINE_FILE=openrefine-linux-${OPENREFINE_VERSION}.tar.gz
ENV OPENREFINE_URL=https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/${OPENREFINE_FILE}

WORKDIR /opt/openrefine

RUN set -xe \
 && apt update \
 && apt install -y curl procps \
 && curl -sSL ${OPENREFINE_URL} | tar xz --strip 1 \
 && rm -rf /var/lib/apt/lists/*

VOLUME /data
WORKDIR /data

EXPOSE 3333

ENTRYPOINT ["/opt/openrefine/refine"]
