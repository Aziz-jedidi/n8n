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

# Install selenium-webdriver globally
RUN npm install -g selenium-webdriver

# Install axios inside n8n's scope
RUN cd /usr/local/lib/node_modules/n8n && npm install axios

# Tell n8n Code node where to find modules
ENV NODE_PATH=/usr/local/lib/node_modules

USER node
