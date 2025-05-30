# Setup scripts

Use the scripts to fully initialise a new Ubuntu-based machine.

### Setup

```bash
./scripts/setup.sh  # will require sudo password
chsh -s /bin/zsh

# when entering tmux: Ctrl - A + I

# In case of multipass
sudo passwd ubuntu

# gh cli, select to use browser
BROWSER=false gh auth login
```
