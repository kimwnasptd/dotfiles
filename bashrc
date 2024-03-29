# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## Prompt
function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1$(parse_git_dirty)/"
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\n$ "

### ########################### Custom changes ###########################
### ########################### ############## ###########################
### ########################### ############## ###########################
export EDITOR='vim'
export BASH_SILENCE_DEPRECATION_WARNING=1

# ssh
export SSH_KEY_PATH=~/.ssh/my_key
export OTWUSERDIR="/d/4lvdQNWjQNpj9yey6x0L"

# clipboard
alias cb="xclip -sel clip"
#alias cb="clip.exe"
#alias cb="pbcopy"

# gpg and signing commits
export GPG_TTY=$(tty)

alias e='vim -p'
alias p='python3'
alias o="xdg-open"
alias t="tmux"
alias s='eval $(keychain --inherit any-once --eval id_rsa)'
alias lst="tree -I '__pycache__|node_modules'"
export PSPARAMS="user,pid,ppid,pgid,sid,tty,stat,start,command"
alias pss="ps ao $PSPARAMS"
alias clip="clip.exe"

alias ensudo="xhost si:localuser:root"
alias disudo="xhost -si:localuser:root"

# SSH
alias pistation='ssh pi@pistation.local'

#sudo /etc/init.d/dbus start &> /dev/null

# wsl2 and ChromeHeadless
CHROME_DIR=/mnt/c/Program\ Files/Google/Chrome
export CHROME_BIN=$CHROME_DIR/Application/chrome.exe

function link-chrome-exe {
    sudo ln -sf \
        $CHROME_EXE \
        /usr/bin/google-chrome
}

# Utility aliases
alias paclist='pacman -Q | grep '
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias globalip='curl ipinfo.io/ip'
alias ts="tmux new -s "
alias ta="tmux attach -t "
alias scale-up='gsettings set org.gnome.desktop.interface text-scaling-factor "1.33" && gsettings set org.gnome.desktop.interface cursor-size "32"'
alias scale-down='gsettings set org.gnome.desktop.interface text-scaling-factor "1" && gsettings set org.gnome.desktop.interface cursor-size "24"'
alias openvpn-arr='su -c "openvpn --cd /etc/openvpn/ --config arr.conf"'
alias k="kubectl"
alias kf="kubectl -n kubeflow"
alias kfu="kubectl -n kubeflow-user-example-com"
alias kfwatch="watch kubectl get pods -n kubeflow"
alias kfuwatch="watch kubectl get pods -n kubeflow-user"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias grep="grep --exclude=\*.{injected,proto,map,crt,swp,woff2} --exclude=\*package-lock.json --exclude-dir=\*node_modules --exclude-dir=\*dist --exclude-dir=\*static"
alias glog="git log --oneline --decorate --graph"
alias netshoot="kubectl run netshoot --rm -i --tty --image nicolaka/netshoot"

# Set up Node Version Manager
#export NVM_DIR="$HOME/.nvm"
#export NVM_SOURCE="/usr/share/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Edit shell and vim configurations
alias zshrc="e $HOME/.zshrc"
alias bashrc="e $HOME/.bashrc"
alias srcsh="source $HOME/.zshrc"
alias vimrc="vim $HOME/.vimrc"

# PATH manupulation
export NOANAPATH=$PATH
export PATH="/opt/anaconda/bin:$PATH"
export PATH="/snap/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH=$PATH:/home/kimwnasptd/.npm-global/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$CLOUDSDK_HOME/bin
export PATH=$PATH:/opt/homebrew/bin

export GOPATH=$HOME/go

# Python verv
export PY_ENVS="$HOME/Code/python-envs"
alias pyenvs="ls ${PY_ENVS}"

# tmux
tmux_kill_all="tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs kill"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# kubectl auto completion
function kubectl-completion() {
    source <(kubectl completion bash)
    complete -o default -F __start_kubectl k
}
if [ /usr/bin/kubectl ]; then kubectl-completion; fi
if [ /usr/local/bin/kubectl ]; then kubectl-completion; fi


export TERM=xterm-256color
export KUBE_EDITOR="vim"

# tmux and remembering commands between shells
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

function proxy-aws() {
    # https://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html
    echo "Fetching AWS IPs..."
    AWS_IPS=$(curl https://ip-ranges.amazonaws.com/ip-ranges.json | \
      jq -M -r '.prefixes[] | select(.service=="EC2") | .ip_prefix' | xargs)

    sshuttle -v -l 0.0.0.0 -r root@transporter.arr $AWS_IPS
}

function proxy-gcp() {
    # https://cloud.google.com/compute/docs/instances/view-ip-address
    echo "Fetching GCP IPs..."
    GCLOUD_IPS=$(gcloud compute instances list --format json | jq -r -M '.[].networkInterfaces[0].accessConfigs[0].natIP' | grep -v null | xargs)

    sshuttle -v -l 0.0.0.0 -r root@transporter.arr $GCLOUD_IPS
}

function arrproxy() {
    #set -x
    # https://docs.aws.amazon.com/general/latest/gr/aws-ip-ranges.html
    echo "Fetching AWS IPs..."
    AWS_IPS=$(curl https://ip-ranges.amazonaws.com/ip-ranges.json | \
      jq -M -r '.prefixes[] | select(.service=="EC2") | .ip_prefix' | xargs)

    # https://cloud.google.com/compute/docs/instances/view-ip-address
    echo "Fetching GCP IPs..."
    GCLOUD_IPS=$(gcloud compute instances list --format json | jq -r -M '.[].networkInterfaces[0].accessConfigs[0].natIP' | grep -v null | xargs)

    echo "Flushing iptables..."
    iptables-flush
    echo "iptables flushing effort completed."

    sshuttle -v -l 0.0.0.0 -r root@transporter.arr $GCLOUD_IPS $AWS_IPS

    #sshuttle -v -r root@transporter.arr 0/0
    #sshuttle -v -r root@transporter.arr -x transporter.arr 0/0
}

function clear-node-modules() {
    find . -type d -name "*node_modules" -exec rm -r -f {} +
}

function pyenv() {
    source $PY_ENVS/$1/bin/activate
}

function covid() {
    curl https://corona-stats.online/$1
}

function replace() {
    EXPR="s#$1#g"
    find . -type f -exec sed -i $EXPR {} +
}

function reload-network() {
    sudo systemctl restart NetworkManager
}

function git-pr-checkout() {
    local remote=$1
    local pr_num=$2

    git fetch $remote pull/$pr_num/head:pr-$pr_num
    git checkout pr-$pr_num
}

# git
function git-https-to-ssh {
    # https://gist.github.com/m14t/3056747

    REPO_URL=`git remote -v | grep -m1 '^origin' | sed -Ene's#.*(https://[^[:space:]]*).*#\1#p'`
    if [ -z "$REPO_URL" ]; then
      echo "-- ERROR:  Could not identify Repo url."
      echo "   It is possible this repo is already using SSH instead of HTTPS."
      exit
    fi

    USER=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\1#p'`
    if [ -z "$USER" ]; then
      echo "-- ERROR:  Could not identify User."
      exit
    fi

    REPO=`echo $REPO_URL | sed -Ene's#https://github.com/([^/]*)/(.*).git#\2#p'`
    if [ -z "$REPO" ]; then
      echo "-- ERROR:  Could not identify Repo."
      exit
    fi

    NEW_URL="git@github.com:$USER/$REPO.git"
    echo "Changing repo url from "
    echo "  '$REPO_URL'"
    echo "      to "
    echo "  '$NEW_URL'"
    echo ""

    CHANGE_CMD="git remote set-url origin $NEW_URL"
    `$CHANGE_CMD`

    echo "Success"
}

# AWS
export EKS_CLUSTER=kimwnasptd-ekf
export EKS_NODEGROUP=general-workers

function eks-k8s {
    aws eks update-kubeconfig --name $EKS_CLUSTER
}

function eks-scale-down {
    aws eks update-nodegroup-config \
        --scaling-config minSize=0,maxSize=1,desiredSize=0 \
        --cluster-name $EKS_CLUSTER \
        --nodegroup-name $EKS_NODEGROUP
}

function eks-scale-up {
    aws eks update-nodegroup-config \
        --scaling-config minSize=0,maxSize=4,desiredSize=3 \
        --cluster-name $EKS_CLUSTER \
        --nodegroup-name $EKS_NODEGROUP
}

# gcloud k8s clusters
export CLUSTER_ZONE="europe-west1-b"
export K8S_CLUSTER="kimwnasptd-kubeflow-dev"
export CLUSTER_ZONE="europe-west1-b"
export CLUSTER_NODES=5
export CLUSTER_POOL=pool-1
export CLUSTER_GPU_POOL=nvidia-gpu

function gcloud-cluster-up {
    gcloud container clusters resize \
        ${K8S_CLUSTER} \
        --num-nodes ${CLUSTER_NODES} \
        --zone ${CLUSTER_ZONE} \
        --project ${PROJECT} \
        --node-pool=${CLUSTER_POOL}
}

function gcloud-cluster-down {
    gcloud container clusters resize \
        ${K8S_CLUSTER} \
        --num-nodes 0 \
        --zone ${CLUSTER_ZONE} \
        --project ${PROJECT} \
        --node-pool=${CLUSTER_POOL}
}

function gcloud-cluster-gpus-up {
    gcloud container clusters resize \
        ${K8S_CLUSTER} \
        --num-nodes 1 \
        --zone ${CLUSTER_ZONE} \
        --project ${PROJECT} \
        --node-pool=${CLUSTER_GPU_POOL}
}

function gcloud-cluster-gpus-up {
    gcloud container clusters resize \
        ${K8S_CLUSTER} \
        --num-nodes 0 \
        --zone ${CLUSTER_ZONE} \
        --project ${PROJECT} \
        --node-pool=${CLUSTER_GPU_POOL}
}

function microk8s-kubeconfig {
    sudo microk8s kubectl config view --raw > $HOME/.kube/config
}

function microk8s-install {
    sudo snap install microk8s --classic --channel=1.24/stable
}

function microk8s-ckf-setup {
    sudo usermod -a -G microk8s $USER
    newgrp microk8s
    sudo chown -f -R $USER ~/.kube
    microk8s enable dns hostpath-storage ingress metallb:10.64.140.43-10.64.140.49
    microk8s status --wait-ready
}

function microk8s-quick-install {
    sudo snap install microk8s --classic --channel=1.24/stable
    sudo chown -f -R $USER ~/.kube
    microk8s enable dns hostpath-storage ingress metallb:10.64.140.43-10.64.140.49
    microk8s-kubeconfig
    microk8s status --wait-ready
}

function ckf-install {
    sg microk8s -c "juju bootstrap microk8s micro"

    # Deploy Kubeflow
    juju add-model kubeflow
    juju deploy kubeflow --channel=1.7/stable --trust

    # Post Deploy Configuration
    juju config dex-auth

    public_url=http://10.64.140.43.nip.io
    static-username=admin
    static-password=admin

    juju config oidc-gatekeeper public-url=http://10.64.140.43.nip.io
}

function microk8s-purge {
    sudo microk8s reset
    sudo snap remove microk8s
    rm -rf ~/.local/share/juju
}
