FROM ubuntu:22.04@sha256:34577a83cd7a8f1e55f6eb173fd9bb70c16127a83d6bf06f56f6b1fff9e406b9

# Settings
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# UTF-8 locale
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
 && locale-gen en_US.UTF-8 \
 && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"

# Runtime + build deps (temporary)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
    openssl \
    ruby \
    ruby-dev \
    build-essential \
    python3 \
 && gem install --no-document \
    bundler:2.5.23 \
    jekyll:4.4.1 \
 && apt-get purge -y \
    build-essential \
    ruby-dev \
    python3 \
 && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*

# Java runtime only
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-21-jre-headless \
 && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Node.js 20 LTS
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y --no-install-recommends nodejs \
 && npm install -g fsh-sushi@3.17.0 \
 && npm cache clean --force \
 && rm -rf /var/lib/apt/lists/*

# Publisher
ARG PUBLISHER_VERSION=2.1.0
ARG PUBLISHER_SHA256=f31b8551d129522399626b71f7e73ef7a07802d0ad5076f3f0b59b39782e0bfa

WORKDIR /tools
RUN curl -fL \
      https://github.com/HL7/fhir-ig-publisher/releases/download/${PUBLISHER_VERSION}/publisher.jar \
      -o publisher.jar \
 && echo "${PUBLISHER_SHA256}  publisher.jar" | sha256sum -c -

WORKDIR /work
ENTRYPOINT ["java", "-jar", "/tools/publisher.jar"]
