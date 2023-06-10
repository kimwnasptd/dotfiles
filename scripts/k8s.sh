# kubectl
set -o xtrace
cd /tmp
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chown $USER kubectl
chmod +x kubectl
mv kubectl ~/.local/bin/kubectl

# kind
/usr/local/go/bin/go install sigs.k8s.io/kind@v0.17.0

# kustomize 5.0.1
wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.0.1/kustomize_v5.0.1_linux_amd64.tar.gz
tar xzvf kustomize_v5.0.1_linux_amd64.tar.gz
chown $USER kustomize
chmod +x kustomize
mv kustomize ~/.local/bin/kustomize-5

# kustomize 3.2
wget https://github.com/kubernetes-sigs/kustomize/releases/download/v3.2.0/kustomize_3.2.0_linux_amd64
chown $USER kustomize_3.2.0_linux_amd64
chmod +x kustomize_3.2.0_linux_amd64
mv kustomize_3.2.0_linux_amd64 ~/.local/bin/kustomize
