#!/bin/bash
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
NVIM_VERSION="v0.11.5"

# remove leftover files
$SCRIPT_DIR/cleanup.sh

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
$SCRIPT_DIR/tree-sitter.sh

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
