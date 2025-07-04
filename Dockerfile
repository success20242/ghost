FROM ghost:5.128.1

USER root

WORKDIR /var/lib/ghost

# Install Postgres driver before copying anything else
RUN npm install pg

# Only copy content (themes, images etc), NOT config.production.json, NOT package.json, NOT node_modules!
COPY content ./content

# Fix permissions
RUN chown -R node:node /var/lib/ghost

USER node
