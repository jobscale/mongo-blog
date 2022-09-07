FROM node:lts-bullseye
WORKDIR /root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y netcat
COPY . .
RUN npm i --production --legacy-peer-deps
RUN rm -fr /var/lib/apt/lists/*
EXPOSE 3000
CMD ["./start.sh"]
