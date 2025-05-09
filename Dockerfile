FROM n8nio/n8n:latest
USER root
RUN npm install -g selenium-webdriver
ENV NODE_FUNCTION_ALLOW_EXTERNAL=selenium-webdriver
ENV NODE_PATH=/usr/local/lib/node_modules
USER node
