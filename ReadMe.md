#  iventoy-docker
Dockerized version of iventoy to allow for easy deployment 

all credit goes to https://www.iventoy.com/

sample docker compose is in repo

# TODO
- <s>setup automated builds</s>
- <s>setup pushing to docker hub</s>

# Example Docker Compose
```yml
version: "3"
services:
  ventoy: 
    image: thedrobe/iventoy-docker
    network_mode: "host" # works best in host or can foward the required ports 
    restart: unless-stopped
    privileged: true # needed for iventoy not to crash on startup
    stop_signal: SIGINT
    volumes:
     - ./iso:/app/iso
```

# Notes 
- this only supports x64 and not arm based processors due to iventoy only supporting that. 
- Am builing arm images in hopes for iventoy to run on arm one day