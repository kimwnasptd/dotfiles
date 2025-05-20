set -o xtrace

# python 3.8 and poetry
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3-poetry

# Canonical tools
sudo snap install charmcraft --classic
sudo snap install juju
getent group lxd | grep -qwF "$USER" || sudo usermod -aG lxd "$USER"

# LXD and docker
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
$SCRIPT_DIR/lxd-docker.sh
