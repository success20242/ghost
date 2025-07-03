FROM ghost:5.128.1

USER root

RUN npm install -g pg

WORKDIR /var/lib/ghost

COPY . .

RUN chown -R node:node /var/lib/ghost

USER node

# Do not override CMD — let Ghost handle startup internally
