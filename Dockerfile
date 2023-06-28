# gunicorn --bind 0.0.0.0:8000 wsgi:app
# docker build . -t frontend
FROM ubuntu:22.04

WORKDIR /app
COPY ./app /app
RUN apt update 
RUN apt upgrade -y
# RUN apk add gcc
# RUN apk add libc-dev
# RUN apk add libffi-dev
# RUN apk add build-base
# RUN apk add bash
#EXPOSE 26000

CMD ["/bin/bash", "-c", "cd /app && bash iventoy.sh start && sleep infinity"]
