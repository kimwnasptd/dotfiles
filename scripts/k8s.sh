set -o xtrace

arch="$(arch)"
case "$arch" in
    'aarch64')
        kustomize_url=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.0.1/kustomize_v5.0.1_linux_arm64.tar.gz
        kubectl_url=https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl
        ;;
    'x86_64')
        kustomize_url=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.0.1/kustomize_v5.0.1_linux_amd64.tar.gz
        kubectl_url=https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
        ;;
esac

# kubectl
cd /tmp
curl -LO $kubectl_url
chown $USER kubectl
chmod +x kubectl
mv kubectl ~/.local/bin/kubectl

# kind
/usr/local/go/bin/go install sigs.k8s.io/kind@v0.20.0

# kustomize 5.0.1
wget $kustomize_url
tar xzvf *.tar.gz
chown $USER kustomize
chmod +x kustomize
mv kustomize ~/.local/bin/kustomize

# kustomize 3.2
#wget https://github.com/kubernetes-sigs/kustomize/releases/download/v3.2.0/kustomize_3.2.0_linux_amd64
#chown $USER kustomize_3.2.0_linux_amd64
#chmod +x kustomize_3.2.0_linux_amd64
#mv kustomize_3.2.0_linux_amd64 ~/.local/bin/kustomize
