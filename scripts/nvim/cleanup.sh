#!/bin/bash
set -e

echo "Removing leftover cache/config directories"
sudo rm -rf ~/.local/share/nvim
sudo rm -rf ~/.local/state/nvim
sudo rm -rf ~/.cache/nvim
