# Using latest LTS slim image for node
FROM node:14-slim

# We're gonna install Chrome separately in order to add its dependencies, so no reason to download puppeteer's Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
# Set puppeteer's default browser to be our Chrome install
ENV PUPPETEER_EXECUTABLE_PATH=/opt/google/chrome/chrome

# Get latest stable Chrome from Google's repositories
RUN apt update \
    && apt upgrade -y \
    && apt install -y wget gnupg ca-certificates \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt update \
    && apt install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Install critical globally in order to use its CLI
RUN npm i -g critical

# We're only using the CLI, so this will be our executable instead of node
ENTRYPOINT ["critical"]