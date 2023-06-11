#!/bin/bash
set -o xtrace
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce

sudo apt install -y docker-ce
sudo groupadd docker
sudo usermod -aG docker ${USER}

# remove need for sudo
#sudo usermod -aG docker $USER
#newgrp docker

# copy wsl config
#cp ${SCRIPT_DIR}/configs/wsl-docker-daemon.json /etc/docker/daemon.json
