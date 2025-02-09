set -o xtrace

sudo iptables  -I DOCKER-USER -i lxdbr0 -j ACCEPT
sudo ip6tables -I DOCKER-USER -i lxdbr0 -j ACCEPT
sudo iptables  -I DOCKER-USER -o lxdbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo ip6tables -I DOCKER-USER -o lxdbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
