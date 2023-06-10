set -eux

echo "Creating users..."
adduser dockremap
usermod -a -G dockremap dockremap
echo 'dockremap:165536:65536' >> /etc/subuid
echo 'dockremap:165536:65536' >> /etc/subgid

echo "Fetchind dind..."
export DIND_COMMIT=d58df1fc6c866447ce2cd129af10e5b507705624
wget -O /tmp/dind "https://raw.githubusercontent.com/docker/docker/${DIND_COMMIT}/hack/dind"
chmod +x /tmp/dind

echo "Fetching docker..."
wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-24.0.2.tgz
tar --extract \
    --file docker.tgz \
    --strip-components 1 \
    --directory /usr/local/bin/ \
    --no-same-owner
rm docker.tgz

URL=https://github.com/docker/buildx/releases/download/v0.10.5/buildx-v0.10.5.linux-amd64
wget -O 'docker-buildx' $URL
plugin='/usr/local/libexec/docker/cli-plugins/docker-buildx'
mkdir -p "$(dirname "$plugin")"
mv -vT 'docker-buildx' "$plugin"
chmod +x "$plugin"

echo "Fetching modprobe script..."
URL=https://raw.githubusercontent.com/docker-library/docker/master/24/cli/modprobe.sh
wget -O - $URL > /tmp/modprobe.sh
chmod +x /tmp/modprobe.sh

echo "Fetching docker-entrypoint.sh..."
URL=https://raw.githubusercontent.com/docker-library/docker/master/24/cli/docker-entrypoint.sh
wget -O - $URL > /tmp/docker-entrypoint.sh
chmod +x /tmp/docker-entrypoint.sh

echo "Fetching dockerd-entrypoint.sh..."
URL=https://raw.githubusercontent.com/docker-library/docker/master/24/dind/dockerd-entrypoint.sh
wget -O - $URL > /tmp/dockerd-entrypoint.sh
chmod +x /tmp/dockerd-entrypoint.sh
