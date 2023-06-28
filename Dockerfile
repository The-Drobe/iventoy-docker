FROM ubuntu:22.04

WORKDIR /app
COPY ./app /app
RUN apt update 
RUN apt upgrade -y

CMD ["/bin/bash", "-c", "cd /app && bash iventoy.sh start && sleep infinity"]
