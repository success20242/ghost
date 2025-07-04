FROM ghost:5.128.1

USER root

WORKDIR /var/lib/ghost

RUN npm install pg

# No content directory to copy, so do not copy anything here!

RUN chown -R node:node /var/lib/ghost

USER node
