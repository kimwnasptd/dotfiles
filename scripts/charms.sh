set -o xtrace

# Canonical tools
sudo snap install charmcraft --classic
sudo snap install juju
getent group lxd | grep -qwF "$USER" || sudo usermod -aG lxd "$USER"

# LXD and docker
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
$SCRIPT_DIR/lxd-docker.sh
