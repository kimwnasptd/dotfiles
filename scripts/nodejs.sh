#!/usr/bin/env bash
set -e

sudo apt install nodejs
sudo apt install npm

echo "Setting npm dir to user home..."
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo "Done!"
