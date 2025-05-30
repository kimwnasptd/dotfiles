# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Locales
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit -u
  alias compinit="echo no more compinit!"
  # https://superuser.com/a/1675753
fi

# https://unix.stackexchange.com/a/608921
export GPG_TTY=$TTY
export DISPLAY=""

export EDITOR="nvim"
alias e=$EDITOR

# tmux
alias ts="tmux new -s "
alias ta="tmux attach -t "

# dotfiles
alias zshrc="e $HOME/.zshrc"
alias bashrc="e $HOME/.bashrc"
alias srcsh="source $HOME/.zshrc"
alias vimrc="e $HOME/.vimrc"

# PATH
export PATH="/snap/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/home/$USER/.npm-global/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$CLOUDSDK_HOME/bin
export PATH=$PATH:/opt/homebrew/bin
export GOPATH=$HOME/go

# utility aliases
alias k="kubectl"
alias kf="kubectl -n kubeflow"
alias kfu="kubectl -n kubeflow-user-example-com"
alias kfa="kubectl -n admin"
alias netshoot="kubectl run netshoot --rm -i --tty --image nicolaka/netshoot"
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"
alias bat="batcat"
alias lst="tree -I '__pycache__|node_modules|venv|.git|.DS_Store|*.log|*.pyc|*.swp'"

# ssh alias
alias ssh-zenitsu="ssh -AX -L 8080:localhost:8080 -D 9999 kimwnasptd@zenitsu.sparidae-palermo.ts.net"
alias ssh-beelink="ssh -AX -L 8080:localhost:8080 kimwnasptd@beelink.sparidae-palermo.ts.net"

source <(kubectl completion zsh)

# Python
export PY_ENVS="$HOME/Code/python-envs"
alias pyenvs="ls ${PY_ENVS}"
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring  # poetry

# Immich
export UPLOAD_LOCATION=./library
export BACKUP_SAMSUNG_SSD=/media/samsung-850-ssd
export BACKUP_PATRIOT_SSD=/media/patriot-burst-ssd

# Generic functions
function multipass-ip() {
    multipass info $1 --format yaml | yq ".$1[0].ipv4[0]"
}

function multipass-ssh() {
    vm=$1
    ssh -AX -L 8080:localhost:8080 ubuntu@$(multipass-ip $vm)
}

function replace() {
    EXPR="s#$1#g"
    find . -type f -exec sed -i $EXPR {} +
}

function clp() {
    if [[ $(which xclip) ]]; then
      xclip -sel clip
    elif [[ $(which pbcopy) ]]; then
      pbcopy
    fi
}

function compress-code-dir {
    output="code-$(hostname)-$(date +"%Y-%m-%d").tar.gz"
    tar -cv --use-compress-program=pigz -f $output $HOME/Code
}

function encrypt {
    gpg -c --output $1.gpg $1
}

function decrypt {
    file=$1
    gpg -d $1 > "${file%.gpg}"
}

function trivy-scan() {
    docker run -v /var/run/docker.sock:/var/run/docker.sock \
      -v `pwd`:`pwd` \
      -w `pwd` \
      --rm \
      --name=scanner \
      aquasec/trivy image \
      --timeout 30m \
      -f json \
      -o trivy-report.json \
      --ignore-unfixed \
      $1
}

# Canonical
alias canonical-vpn-up="sudo nmcli con up uk-kimwnasptd"
alias canonical-vpn-down="sudo nmcli con down uk-kimwnasptd"

function lxd-networking {
    sudo iptables  -I DOCKER-USER -i lxdbr0 -j ACCEPT
    sudo ip6tables -I DOCKER-USER -i lxdbr0 -j ACCEPT
    sudo iptables  -I DOCKER-USER -o lxdbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
    sudo ip6tables -I DOCKER-USER -o lxdbr0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
}

function rock-docker-load {
    img=$1

    rock=$(ls | grep ".rock")
    sudo rockcraft.skopeo --insecure-policy \
        copy \
        oci-archive:$rock \
        docker-daemon:$img
}

function rock-docker-push {
    img=$1

    rock-docker-load $img
    docker push $img
}

function rock-run {
    cmd=$1

    rock=$(ls | grep ".rock")
    sudo rockcraft.skopeo --insecure-policy \
        copy \
        oci-archive:$rock \
        docker-daemon:tmp-rock:latest \
        1>/dev/null

    echo "---| $cmd"
    docker run --rm --entrypoint bash -ti tmp-rock -c $cmd
}

function rock-microk8s-load {
    img=$1

    rock-docker-load $img

    docker save $img > rock.tar
    sudo microk8s ctr image import rock.tar

    rm rock.tar
}

function ck8s-kubeconfig {
    sudo k8s config view > $HOME/.kube/config
}

function microk8s-kubeconfig {
    sudo microk8s kubectl config view --raw > $HOME/.kube/config
}

function install-microk8s {
    sudo snap install microk8s --classic --channel=1.31/stable
    sudo microk8s enable dns
    sudo microk8s enable hostpath-storage
    sudo microk8s enable ingress
    sudo microk8s enable rbac
    sudo microk8s enable metallb:10.64.140.43-10.64.140.49
    microk8s-kubeconfig
}

function install-juju-kubeflow {
    sudo snap install juju --classic --channel=3.6/stable
    rm -rf ~/.local/share/juju

    if command -v microk8s >/dev/null 2>&1; then
        sudo microk8s config | juju add-k8s sibyl-k8s --client
    else
        cat .kube/config | juju add-k8s sibyl-k8s --client
    fi

    juju bootstrap sibyl-k8s sibyl
    juju add-model kubeflow
}

function install-juju-sibyl {
    sudo snap install juju --classic --channel=3.6/stable
    rm -rf ~/.local/share/juju

    if command -v microk8s >/dev/null 2>&1; then
        echo "Adding MicroK8s to juju"
        sudo microk8s config | juju add-k8s sibyl-k8s --client
    else
        echo "Adding generic K8s to juju"
        cat ~/.kube/config | juju add-k8s sibyl-k8s --client
    fi

    juju bootstrap sibyl-k8s sibyl
    juju add-model tokyo
}

function install-ckf-1.10-only {
    juju deploy kubeflow --trust  --channel=1.10/stable

    juju config dex-auth static-username=admin
    juju config dex-auth static-password=admin

    # mlflow
    juju deploy mlflow --channel=2.15/stable --trust
    juju deploy resource-dispatcher --channel 2.0/stable --trust

    juju integrate mlflow-server:secrets resource-dispatcher:secrets
    juju integrate mlflow-server:pod-defaults resource-dispatcher:pod-defaults

    juju integrate mlflow-minio:object-storage kserve-controller:object-storage
    juju integrate kserve-controller:service-accounts resource-dispatcher:service-accounts
    juju integrate kserve-controller:secrets resource-dispatcher:secrets

    juju integrate mlflow-server:ingress istio-pilot:ingress
    juju integrate mlflow-server:dashboard-links kubeflow-dashboard:links
}

function install-ckf-1.10 {
    install-microk8s
    install-juju-kubeflow
    install-ckf-1.10-only
}

function reinstall-microk8s-juju {
    sudo snap remove microk8s --purge
    install-microk8s
    install-juju-sibyl
}

function venv-python3.8 {
    python3.8 -m venv venv
    source venv/bin/activate
    pip install tox
}

function venv-python3.10 {
    python3.10 -m venv venv
    source venv/bin/activate
    pip install tox
}

function venv-python3.12 {
    python3.12 -m venv venv
    source venv/bin/activate
    pip install tox
}

# AWS VMs functions
function aws-stop-instance() {
    INSTANCE_ID=$(aws ec2 describe-instances \
      --filters "Name=tag:Name,Values=$1" \
      --output text \
      --query 'Reservations[*].Instances[*].InstanceId')

    aws ec2 stop-instances --instance-ids $INSTANCE_ID
}

function aws-start-instance() {
    INSTANCE_ID=$(aws ec2 describe-instances \
      --filters "Name=tag:Name,Values=$1" \
      --output text \
      --query 'Reservations[*].Instances[*].InstanceId')

    aws ec2 start-instances --instance-ids $INSTANCE_ID
}

function aws-ip-instance() {
  INSTANCE_IP=$(aws ec2 describe-instances \
    --filters "Name=tag:Name,Values=$1" \
    --output text \
    --query 'Reservations[*].Instances[*].PublicIpAddress')

  echo $INSTANCE_IP
}

function aws-ssh-instance() {
    INSTANCE_IP=$(aws-ip-instance $1)

    ssh -XA \
      -L 8080:localhost:8080 \
      -L 20001:localhost:20001 \
      -D 9999 \
      ubuntu@$INSTANCE_IP
}

# EKS helpers
export EKS_CLUSTER=dev
export EKS_NODEGROUP=general-workers

function eks-kubeconfig {
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

# Git functions
function git-pr-checkout() {
    local remote=$1
    local pr_num=$2

    git fetch $remote pull/$pr_num/head:pr-$pr_num
    git checkout pr-$pr_num
}

function ssh-tmux-fix() {
  eval $(tmux show-env -s | grep SSH_AUTH)
}

function git-rebase-sign() {
    git rebase --exec 'git commit --amend --no-edit -n -S' -i $1
}

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
