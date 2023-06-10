#!/bin/bash
set -e
set -o xtrace
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
VIMRC=$SCRIPT_DIR/../../vimrc

echo "Installing vim..."
sudo apt install vim

echo "Installing Vundle for plugins..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Symlink-ing vimrc..."
if test -f "~/.vimrc"; then
    echo "Removing existing .vimrc"
    rm ~/.vimrc
fi
ln -s $VIMRC $HOME/.vimrc

echo "Installing all plugins..."
sed -i 's/colorscheme codedark/"colorscheme codedark/g' $VIMRC
vim +PluginInstall +qall
sed -i 's/"colorscheme codedark/colorscheme codedark/g' $VIMRC
