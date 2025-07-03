# see versions at https://hub.docker.com/_/ghost
FROM ghost:5.128.1

# Install the PostgreSQL driver
USER root
RUN npm install pg

# Switch back to Ghost default user
USER node

WORKDIR $GHOST_INSTALL
COPY . .

ENTRYPOINT []
CMD ["./start.sh"]
