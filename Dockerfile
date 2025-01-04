FROM node:latest

WORKDIR /home/choreouser

EXPOSE 3000

COPY files/* /home/choreouser/

RUN apt-get update && apt upgrade -y &&\
    apt-get install -y apt-utils &&\
    
    apt install --only-upgrade linux-libc-dev &&\
    apt-get install -y iproute2 vim curl screen net-tools htop netcat-openbsd sudo systemd  &&\
    cd /home/choreouser/ &&\
    chmod +x index.js swith web  start.sh cloud &&\
    addgroup --gid 10008 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10008 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\

    npm install

CMD [ "node", "index.js" ]

USER 10008
