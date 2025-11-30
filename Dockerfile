FROM node:lts-trixie-slim
WORKDIR /home/node
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  netcat-openbsd \
 && apt-get clean && rm -fr /var/lib/apt/lists/*
USER node
COPY --chown=node:staff package.json .
RUN npm i --omit-dev --legacy-peer-deps
COPY --chown=node:staff . .
EXPOSE 3000
CMD ["./start.sh"]
