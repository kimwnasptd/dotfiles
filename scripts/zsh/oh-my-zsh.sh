#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

if [ ! -d "$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]
then
  echo "Setting up syntax-highlighting..."
  git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]
then
  echo "Setting up autosuggestions"
  git clone \
    https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
echo "autosuggestions successfully set up"

echo "Installing and setting up powerline10k"
if [ ! -d "$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]
then
  echo "Setting up powerline10k"
  git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
