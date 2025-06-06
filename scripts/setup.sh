#!/usr/bin/env bash
set -e
set -o xtrace

mkdir -p ~/.local/bin

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo apt install -y xclip curl

$SCRIPT_DIR/git.sh
$SCRIPT_DIR/k8s.sh
$SCRIPT_DIR/golang.sh
$SCRIPT_DIR/aws.sh
$SCRIPT_DIR/nodejs.sh
$SCRIPT_DIR/tmux/tmux.sh
$SCRIPT_DIR/docker.sh
$SCRIPT_DIR/python.sh
$SCRIPT_DIR/charms.sh
$SCRIPT_DIR/nvim/install.sh
$SCRIPT_DIR/nvim/soft-links.sh
$SCRIPT_DIR/pass.sh
$SCRIPT_DIR/zsh/install.sh
$SCRIPT_DIR/zsh/oh-my-zsh.sh
$SCRIPT_DIR/zsh/ln-zshrc.sh
