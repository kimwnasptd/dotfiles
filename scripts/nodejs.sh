#!/usr/bin/env bash
set -e

apt install -y nodejs  npm # needs sudo

echo "Setting npm dir to user home..."
mkdir -p ~/.npm-global
npm config set prefix '~/.npm-global'
echo "Done!"
