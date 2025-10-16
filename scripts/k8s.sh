set -o xtrace

KUSTOMIZE_VERSION=v5.3.0
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
KIND_VERSION=v0.29.0

arch="$(arch)"
case "$arch" in
    'aarch64')
        kustomize_url=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F$KUSTOMIZE_VERSION/kustomize_${KUSTOMIZE_VERSION}_linux_arm64.tar.gz
        kubectl_url=https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/arm64/kubectl
        ;;
    'x86_64')
        kustomize_url=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F$KUSTOMIZE_VERSION/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz
        kubectl_url=https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl
        ;;
esac

# needed directories
mkdir -p ~/.local/bin
mkdir -p ~/.kube

# kubectl
cd /tmp
curl -LO $kubectl_url
chown $USER kubectl
chmod +x kubectl
mv kubectl ~/.local/bin/kubectl

# kind
/usr/local/go/bin/go install sigs.k8s.io/kind@${KIND_VERSION}

# kustomize
wget $kustomize_url
tar xzvf kustomize*.tar.gz
chown $USER kustomize
chmod +x kustomize
mv kustomize ~/.local/bin/kustomize

# kustomize 3.2
#wget https://github.com/kubernetes-sigs/kustomize/releases/download/v3.2.0/kustomize_3.2.0_linux_amd64
#chown $USER kustomize_3.2.0_linux_amd64
#chmod +x kustomize_3.2.0_linux_amd64
#mv kustomize_3.2.0_linux_amd64 ~/.local/bin/kustomize
