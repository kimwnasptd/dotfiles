set -o xtrace

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3-poetry
sudo snap install charmcraft --classic
getent group lxd | grep -qwF "$USER" || sudo usermod -aG lxd "$USER"

# LXD and docker
sudo iptables -I DOCKER-USER -i lxdbr0 -j ACCEPT
sudo iptables -I DOCKER-USER -o lxdbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

