#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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
        gettext

cd /tmp
git clone https://github.com/neovim/neovim
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
