FROM node:latest

WORKDIR /home/choreouser

EXPOSE 54321

COPY files/* /home/choreouser/

RUN apt-get update &&\
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim curl screen net-tools htop netcat-openbsd sudo &&\
    chmod +x index.js swith web  start.sh cloud &&\
    wget https://github.com/vaxilu/x-ui/releases/download/0.3.2/x-ui-linux-amd64.tar.gz &&\
    tar zxvf x-ui-linux-amd64.tar.gz &&\
    chmod +x x-ui/x-ui x-ui/bin/xray-linux-* x-ui/x-ui.sh &&\
    
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    npm install

CMD [ "node", "index.js" ]

USER 10008
