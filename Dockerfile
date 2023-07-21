FROM ubuntu:22.04

WORKDIR /app
RUN apt update 
RUN apt upgrade -y
RUN apt install curl -y
RUN apt install zsh -y
# download iventoy realse and extract it
SHELL ["/bin/zsh", "-c"]
RUN Version=$(curl -L --stderr -  --location --remote-header-name https://github.com/ventoy/PXE/releases/latest | grep -o -E '"/ventoy/PXE/releases/tag/[^"]+"') && \
    Replace="/ventoy/PXE/releases/tag/" && \
    Version=$(echo "$Version" | sed "s|$Replace||g") && \
    Version="${Version%%$'\n'*}" && \
    Version="${Version%% *}" && \
    Version=$(echo "$Version" | sed "s|"v"||g") && \
    Version=$(echo "$Version" | sed 's|"||g') && \
    echo $Version && \
    DownloadLink="https://github.com/ventoy/PXE/releases/latest/download/iventoy-"$Version"-linux-free.tar.gz" && \
    echo $DownloadLink && \
    curl --output iventoy.tar.gz --location --remote-header-name "https://github.com/ventoy/PXE/releases/latest/download/iventoy-"$Version"-linux-free.tar.gz" && \
    tar -xvf iventoy.tar.gz && \
    rm -rf iventoy.tar.gz


CMD ["/bin/bash", "-c", "cd /app && bash iventoy.sh start && sleep infinity"]
