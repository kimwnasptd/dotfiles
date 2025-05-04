#!/bin/bash
set -o xtrace
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL \
	https://download.docker.com/linux/ubuntu/gpg \
	-o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add apt repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker
sudo apt install -y \
	docker-ce docker-ce-cli \
	containerd.io \
	docker-buildx-plugin docker-compose-plugin

# setup non-root usage
sudo groupadd docker
sudo usermod -aG docker ${USER}

# copy wsl config
#cp ${SCRIPT_DIR}/configs/wsl-docker-daemon.json /etc/docker/daemon.json
