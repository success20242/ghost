FROM ghost:5.128.1

USER root

WORKDIR /var/lib/ghost

RUN npm install pg

RUN chown -R node:node /var/lib/ghost

USER node
