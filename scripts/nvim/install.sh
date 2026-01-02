#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
NVIM_VERSION="v0.11.5"
TREE_SITTER_VERSION="v0.26.3"
TREE_SITTER_BINARY="tree-sitter-linux-x64"

# remove leftover files
echo "Removing leftover cache/config directories"
sudo rm -rf ~/.local/share/nvim
sudo rm -rf ~/.local/state/nvim
sudo rm -rf ~/.cache/nvim

# install dependencies
echo "Installing build dependencies"
sudo apt-get install -y \
        autoconf \
        automake \
        cmake \
        g++ \
        libtool \
        libtool-bin \
        ninja-build \
        pkg-config \
        unzip \
        gettext \
        inotify-tools \
        ripgrep

# install tree-sitter-cli
mkdir -p ~/.local/bin
wget https://github.com/tree-sitter/tree-sitter/releases/download/$TREE_SITTER_VERSION/$TREE_SITTER_BINARY.gz
echo "Un-zipping tree-sitter binary"
gunzip $TREE_SITTER_BINARY.gz
chmod +x $TREE_SITTER_BINARY
echo "Installing tree-sitter binary"
mv $TREE_SITTER_BINARY ~/.local/bin/tree-sitter

# build from source
echo "Building neovim deb package"
cd /tmp
if [ ! -d "neovim" ]; then
  git clone https://github.com/neovim/neovim
fi

cd neovim && git fetch
git checkout $NVIM_VERSION
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB
sudo dpkg -i nvim-linux-x86_64.deb
