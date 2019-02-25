#!/usr/bin/env bash
set -e

ENV_FILE=preseed.env

echo "Encrypting env..."
rm -f "${ENV_FILE}.gpg"
gpg --armor --batch --symmetric --output "${ENV_FILE}.gpg" $ENV_FILE
