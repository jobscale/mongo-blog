FROM jobscale/node
SHELL ["bash", "-c"]

WORKDIR /root

RUN apt-get update && apt-get install -y netcat

COPY . .
RUN . .nvm/nvm.sh && npm i

EXPOSE $PORT
CMD ["./daemon"]
