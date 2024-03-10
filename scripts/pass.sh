set -o xtrace

sudo apt install pass -y
if [ -d "$HOME/.password-store" ]
then
    echo "Password store already exists. Will NOT delete."
else
    echo "Setting up password store"
    git clone git@github.com:kimwnasptd/passwords ~/.password-store
fi
