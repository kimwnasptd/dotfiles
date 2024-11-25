set -o xtrace

pip install poetry
pip install tox
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
