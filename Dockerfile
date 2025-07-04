FROM ghost:5.128.1

USER root

WORKDIR /var/lib/ghost

# Install pg in the directory Ghost expects
RUN npm install pg

# Only copy what you need (if anything). Remove or limit this line if you have no custom content.
# COPY content ./content

RUN chown -R node:node /var/lib/ghost

USER node
