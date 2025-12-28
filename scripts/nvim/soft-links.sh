#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ -d "$HOME/.config/nvim" ]
then
    echo "Removing existing $USER/.config/nvim"
    rm -rf $HOME/.config/nvim
fi

echo "Linking nvim config folder"
mkdir -p $HOME/.config
ln -s $SCRIPT_DIR/../../nvim-config $HOME/.config/nvim
