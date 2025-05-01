FROM n8nio/n8n

# Switch to root to install packages
USER root

# Install Python, pip, Chrome, chromedriver, and dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    wget \
    unzip \
    bash \
    udev \
    chromium \
    chromium-chromedriver \
    libgcc \
    libstdc++ \
    && pip3 install selenium --break-system-packages


# Set Chrome/Chromedriver path for Selenium
ENV CHROME_BIN=/usr/lib/chromium/chromium
ENV CHROMEDRIVER_PATH=/usr/lib/chromium/chromedriver

# Switch back to the n8n user
USER node

# Start n8n
CMD ["n8n"]
