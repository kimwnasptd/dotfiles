#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Installing Vundle for plugins..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Symlink-ing vimrc..."
if test -f "~/.vimrc"; then
    echo "Removing existing .vimrc"
    rm ~/.vimrc
fi
ln -s $SCRIPT_DIR/../../vimrc $HOME/.vimrc

echo "Installing all plugins..."
vim +PluginInstall +qall
