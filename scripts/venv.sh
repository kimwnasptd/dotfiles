#!/usr/bin/env bash
set -e
set -o xtrace

sudo apt install -y python3-venv

python3 -m venv ~/Code/python-envs/kfapps
python3 -m venv ~/Code/python-envs/rok
