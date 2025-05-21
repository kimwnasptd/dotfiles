set -o xtrace

# Older python versions and poetry
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y \
    python3-poetry \
    python3.8 python3.8-venv \
    python3.10 python3.10-venv \
    python3.12-venv
