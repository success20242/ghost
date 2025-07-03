FROM ghost:5.128.1

USER root

WORKDIR /var/lib/ghost

COPY . .

RUN chown -R node:node /var/lib/ghost

USER node

# No CMD override: use Ghost's default entrypoint
