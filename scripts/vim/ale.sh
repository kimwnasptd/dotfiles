set -o xtrace
echo "Installing Python related linters/formatters..."
sudo apt install -y isort python3-pylsp python3-autopep8 \
    flake8

echo "Installing golang linters/formatters..."
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
go install golang.org/x/lint/golint@latest

echo "Installing frontend linters/formatters..."
apt install eslint npm -y
npm install -g typescript-language-server typescript prettier
