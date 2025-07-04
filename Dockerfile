FROM ghost:5.128.1

USER root

WORKDIR /var/lib/ghost

# Install the 'pg' Postgres driver in the correct place for Ghost
RUN npm install pg

# Copy only your themes and content (NOT package.json, NOT node_modules, NOT config.production.json)
COPY content ./content

# Fix permissions
RUN chown -R node:node /var/lib/ghost

USER node
