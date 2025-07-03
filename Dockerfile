# Use official Ghost base image
FROM ghost:5.128.1

# Switch to root to install pg and fix permissions
USER root

# Install the PostgreSQL driver
RUN npm install pg

# Fix ownership of Ghost content and config files to the 'node' user (usually uid 1000)
RUN chown -R node:node $GHOST_INSTALL /var/lib/ghost/content /var/lib/ghost/config.production.json

# Switch back to Ghost default user (node)
USER node

WORKDIR $GHOST_INSTALL

# Copy your custom files into the container
COPY . .

# Clear entrypoint to avoid conflicts and start Ghost
ENTRYPOINT []
CMD ["./start.sh"]
