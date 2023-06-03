cd /tmp

wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz  # needs sudo
