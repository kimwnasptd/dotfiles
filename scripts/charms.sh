set -o xtrace

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3-poetry
sudo snap install charmcraft --classic
getent group lxd | grep -qwF "$USER" || sudo usermod -aG lxd "$USER"

# LXD and docker
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$SCRIPT_DIR/lxd-docker.sh
