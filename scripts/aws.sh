arch="$(arch)"
case "$arch" in
    'aarch64')
        URL="https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip"
        ;;
    'x86_64')
        URL="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
        ;;
esac

curl $URL -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

rm -rf ./awscliv2.zip
rm -rf ./aws
