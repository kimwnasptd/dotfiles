#!/usr/bin/env bash
set -e

mkdir ~/.local/bin

./k8s.sh
./pass.sh
./golang.sh
./gcloud.sh
./nodejs.sh
./bash/bash.sh
./tmux/tmux.sh
./docker/docker.sh
./vim/vim.sh
./vim/ale.sh
