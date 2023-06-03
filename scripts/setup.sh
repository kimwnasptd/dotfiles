#!/usr/bin/env bash
set -e

mkdir -p ~/.local/bin

./k8s.sh
./golang.sh
./nodejs.sh
./bash/bash.sh
./tmux/tmux.sh
./docker/docker.sh
./vim/vim.sh
./vim/ale.sh
