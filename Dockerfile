# Use official Ghost base image
FROM ghost:5.128.1

# Switch to root to install pg and fix permissions
USER root

# Install PostgreSQL driver
RUN npm install pg

# Set Ghost working directory
WORKDIR /var/lib/ghost

# Copy project files into container
COPY . .

# Set correct ownership of everything for the 'node' user
RUN chown -R node:node /var/lib/ghost

# Switch to Ghost default user
USER node

# Start Ghost with default entrypoint
CMD ["node", "current/index.js"]
