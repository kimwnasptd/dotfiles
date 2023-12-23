#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ -f "$HOME/.zshrc" ]
then
    echo "Removing existing .zshrc"
    rm ~/.zshrc
fi
echo "Linking zshrc file"
ln -s $SCRIPT_DIR/../../zshrc $HOME/.zshrc


if [ -f "$HOME/.p10k.zsh" ]
then
    echo "Removing existing .p10k.zsh"
    rm ~/.p10k.zsh
fi
echo "Linking p10k.zsh file"
ln -s $SCRIPT_DIR/../../p10k.zsh $HOME/.p10k.zsh
