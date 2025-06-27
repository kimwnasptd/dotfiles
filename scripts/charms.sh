set -o xtrace

# Canonical tools
sudo snap install charmcraft --classic
sudo snap install juju
getent group lxd | grep -qwF "$USER" || sudo usermod -aG lxd "$USER"

# LXD and docker
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
$SCRIPT_DIR/lxd-docker.sh

# GH CLI
wget https://github.com/cli/cli/releases/download/v2.74.0/gh_2.74.0_linux_amd64.deb
sudo dpkg -i gh_2.74.0_linux_amd64.deb
rm gh_2.74.0_linux_amd64.deb

# jhack
sudo snap install --edge jhack
sudo snap connect jhack:dot-local-share-juju snapd
sudo snap connect jhack:ssh-read snapd
