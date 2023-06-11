set -o xtrace
cd /tmp

arch="$(arch)"
case "$arch" in
    'aarch64')
        url=https://go.dev/dl/go1.20.2.linux-arm64.tar.gz
        ;;
    'x86_64')
        url=https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
        ;;
esac

wget $url -O golang.tar.gz

echo "Extracting the golang tar..."
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf golang.tar.gz  # needs sudo
