set -o xtrace
cd /tmp

wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz

echo "Extracting the golang tar..."
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz  # needs sudo
