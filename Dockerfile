FROM n8nio/n8n:latest

USER root

# Install system dependencies
RUN apk update && \
    apk add --no-cache \
        python3 \
        py3-pip \
        chromium \
        chromium-chromedriver \
        bash \
        curl \
        git \
        libffi \
        libffi-dev \
        gcc \
        musl-dev \
        libstdc++ \
        jpeg-dev \
        zlib-dev \
        libxml2-dev \
        libxslt-dev \
        libcurl \
        libressl \
        libressl-dev \
        build-base


# Install Node.js selenium-webdriver for use in Code node
RUN npm install -g selenium-webdriver
ENV NODE_PATH=/usr/local/lib/node_modules

USER node
