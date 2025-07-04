FROM ghost:5.128.1

USER root

WORKDIR /var/lib/ghost

# Install `pg` for Postgres support
RUN npm install pg

# Copy your content (themes, images, etc) after installing `pg`
COPY . .

# Fix ownership
RUN chown -R node:node /var/lib/ghost

USER node
