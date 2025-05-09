FROM n8nio/n8n:latest
USER root
RUN npm install --prefix /data selenium-webdriver
ENV NODE_PATH=/data/node_modules
USER node
