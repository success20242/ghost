FROM ghFROM ghost:5.128.1

# Become root to install packages
USER root

# Copy all custom content first
WORKDIR /var/lib/ghost
COPY . .

# Install 'pg' in the version directory Ghost uses
WORKDIR /var/lib/ghost/versions/5.128.1
RUN npm install pg

# Ensure correct ownership
RUN chown -R node:node /var/lib/ghost

# Switch back to Ghost defaults
USER node
WORKDIR /var/lib/ghost

# Use default CMD and ENTRYPOINT from base Ghost image
ost:5.128.1

USER root

WORKDIR /var/lib/ghost

COPY . .

RUN chown -R node:node /var/lib/ghost

USER node

# No CMD override: use Ghost's default entrypoint
