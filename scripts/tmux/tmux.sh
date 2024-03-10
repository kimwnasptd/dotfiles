#!/bin/bash
set -o xtrace
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing tmux..."
sudo apt install -y tmux

echo "Setting up tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ -f "$HOME/.tmux.conf" ]
then
    echo "Removing existing .tmux.conf"
    rm ~/.tmux.conf
fi
echo "Linking tmux.conf file"
ln -s $SCRIPT_DIR/../../tmux.conf $HOME/.tmux.conf
