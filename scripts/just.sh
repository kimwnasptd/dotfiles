sudp apt install just -y

echo "Setting  up completions."
mkdir -p ~/.oh-my-zsh/completions

# autocompletions
just --completions zsh > ~/.oh-my-zsh/completions/_just
