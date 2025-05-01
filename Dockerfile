FROM n8nio/n8n

# Switch to root to install packages
USER root

# Install Python, Chromium, and required dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    chromium \
    chromium-chromedriver \
    build-base \
    python3-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    musl-dev \
    g++ \
    pkgconfig \
    wget \
    unzip \
    udev \
    ttf-freefont

# Set environment variables for Selenium
ENV CHROME_BIN=/usr/lib/chromium/chromium
ENV CHROMEDRIVER_PATH=/usr/lib/chromium/chromedriver

# Set up Python virtual environment and install Selenium
RUN python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    python3 -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

# Install Selenium only
RUN pip install --no-cache-dir selenium

# Switch back to n8n user
USER node

# Start n8n
CMD ["n8n"]