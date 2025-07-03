# Use official Ghost base image
FROM ghost:5.128.1

# Switch to root to install pg and fix permissions
USER root

# Install the PostgreSQL driver
RUN npm install pg

# Copy custom files early so we can fix permissions
WORKDIR /var/lib/ghost
COPY . .

# Fix permissions to allow Ghost user to access config
RUN chown -R node:node /var/lib/ghost

# Switch back to Ghost default user
USER node

# Start Ghost normally
ENTRYPOINT []
CMD ["node", "current/index.js"]
