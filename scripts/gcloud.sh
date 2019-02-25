#!/usr/bin/env bash
set -e

sudo apt-get install apt-transport-https ca-certificates gnupg -y
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-cli -y

# logins
gcloud auth login --no-launch-browser
gcloud auth application-default login
gcloud auth configure-docker
