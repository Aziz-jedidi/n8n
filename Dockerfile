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

# Install Node.js dependencies globally
RUN npm install -g selenium-webdriver axios

# Required by n8n for code node module access
ENV NODE_PATH=/usr/local/lib/node_modules
ENV NODE_FUNCTION_ALLOW_BUILTIN=fs,path
ENV NODE_FUNCTION_ALLOW_EXTERNAL=axios,selenium-webdriver

USER node
