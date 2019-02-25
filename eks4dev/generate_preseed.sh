#!/usr/bin/env bash
set -e

echo "Decrypting Dockerconfig"
export ENCRYPTED_DOCKERCONFIG=$(cat dockerconfig.json.gpg)

echo "Decrypting SSH Key"
export UNENCRYPTED_SSH_KEY=$(gpg -d id_rsa.gpg)

echo "Sourcing the env file"
gpg -d preseed.env.gpg > preseed.env
export $(cat preseed.env | xargs) rails

echo "Generating preseed file with Jinja"
j2 preseed.py.j2 -o preseed.py


