#!/usr/bin/env bash
set -e
set -o xtrace

echo "Setting up bashrc..."

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if ! test -f "~/.bashrc"; then
    echo "Removing existing .bashrc"
    rm ~/.bashrc
fi
ln -s $SCRIPT_DIR/../../bashrc $HOME/.bashrc
ln -s $SCRIPT_DIR/../../bashrc $HOME/.bash_profile
