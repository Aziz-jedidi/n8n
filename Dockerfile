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

# Create a virtual environment and install Python dependencies
RUN python3 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install \
        selenium \
        requests

# Install Node.js selenium-webdriver for use in Code node
RUN npm install --prefix /data selenium-webdriver

# Set environment variables for Chrome and chromedriver
ENV PATH="/opt/venv/bin:$PATH"
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMEDRIVER_BIN=/usr/bin/chromedriver
ENV NODE_FUNCTION_ALLOW_EXTERNAL=selenium-webdriver
ENV NODE_PATH=/data/node_modules

# Allow n8n user to use Chromium
RUN mkdir -p /home/node/.cache && \
    chown -R node:node /home/node/.cache

USER node
