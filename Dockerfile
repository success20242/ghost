FROM ghost:5.128.1

# Become root to install OS dependencies
USER root

# Install native build tools required by 'pg'
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
 && rm -rf /var/lib/apt/lists/*

# Install 'pg' inside the Ghost version directory
WORKDIR /var/lib/ghost/versions/5.128.1
RUN npm install pg

# (Optional) Copy only custom theme/content (not everything!)
# Avoid copying package.json, node_modules, etc.
# COPY ./content /var/lib/ghost/content

# Ensure proper ownership
RUN chown -R node:node /var/lib/ghost

# Switch back to default user and working directory
USER node
WORKDIR /var/lib/ghost
