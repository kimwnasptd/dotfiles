#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ -f "~/.zshrc" ]
then
    echo "Removing existing .zshrc"
    rm ~/.zshrc
fi
ln -s $SCRIPT_DIR/../../zshrc $HOME/.zshrc
