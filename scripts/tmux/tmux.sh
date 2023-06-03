#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing tmux..."
apt install -y tmux

echo "Setting up tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Symlin-ing tmux.conf"
ln -s $SCRIPT_DIR/../../tmux.conf $HOME/.tmux.conf
