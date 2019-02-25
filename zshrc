# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export EDITOR='vim'
export BASH_SILENCE_DEPRECATION_WARNING=1

# ssh
export SSH_KEY_PATH=~/.ssh/my_key
export OTWUSERDIR="/d/4lvdQNWjQNpj9yey6x0L"

alias c='xclip -in -selection clipboard'
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
alias arrikto-chrome='google-chrome-stable --user-data-dir=/home/$USER/.config/google-chrome-arrikto/'
alias ts="tmux new -s "
alias ta="tmux attach -t "
alias scale-up='gsettings set org.gnome.desktop.interface text-scaling-factor "1.33" && gsettings set org.gnome.desktop.interface cursor-size "32"'
alias scale-down='gsettings set org.gnome.desktop.interface text-scaling-factor "1" && gsettings set org.gnome.desktop.interface cursor-size "24"'
alias openvpn-arr='su -c "openvpn --cd /etc/openvpn/ --config arr.conf"'
alias k="kubectl"
alias kf="kubectl -n kubeflow"
alias kfu="kubectl -n kubeflow-user"
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
export PATH="/home/$USER/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH=$PATH:/home/kimwnasptd/.npm-global/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$CLOUDSDK_HOME/bin
export PATH="/opt/homebrew/bin:$PATH"

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

# kubectl auto completion (zsh)
function kubectl-completion() {
    #source <(kubectl completion bash)
    #complete -o default -F __start_kubectl k
    source <(kubectl completion zsh)
}

if [ /usr/bin/kubectl ]; then kubectl-completion; fi
if [ /usr/local/bin/kubectl ]; then kubectl-completion; fi


export TERM=xterm-256color
export KUBE_EDITOR="vim"

# Custom utility functions
function retag-arrikto-image() {
    echo "Pulling image: $1"
    docker pull $1
    IMG=$(echo $1 | sed --expression='s/arrikto-playground/arrikto/g')

    echo "Pushing image: $IMG"
    docker tag $1 $IMG
    docker push $IMG
}

function iptables-flush() {
    # Accept all traffic first to avoid ssh lockdown  via iptables firewall rules #
    sudo iptables -P INPUT ACCEPT
    sudo iptables -P FORWARD ACCEPT
    sudo iptables -P OUTPUT ACCEPT

    # Flush All Iptables Chains/Firewall rules #
    sudo iptables -F

    # Delete all Iptables Chains #
    sudo iptables -X

    # Flush all counters too #
    sudo iptables -Z
    # Flush and delete all nat and  mangle #
    sudo iptables -t nat -F
    sudo iptables -t nat -X
    sudo iptables -t mangle -F
    sudo iptables -t mangle -X
    sudo iptables -t raw -F
    sudo iptables -t raw -X
}

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

# Minikf
export ARR_GCP_PROJECT="arrikto-playground"
export ARR_GCP_MINIKF_ZONE="europe-west1-b"
export ARR_GCP_MINIKF="kimwnasptd-minikf-dev"

function minikf-ip() {
    gcloud compute instances describe \
        --project ${ARR_GCP_PROJECT} \
        --zone ${ARR_GCP_MINIKF_ZONE} ${ARR_GCP_MINIKF} \
        --format='get(networkInterfaces[0].accessConfigs[0].natIP)'
}

function minikf-proxy() {
    sshuttle -v -l 0.0.0.0 -r root@transporter.arr $(minikf-ip)
}

function minikf-start {
    gcloud compute instances start \
        --project arrikto-playground ${ARR_GCP_MINIKF} \
        --zone=${ARR_GCP_MINIKF_ZONE}
}

function minikf-stop {
    gcloud compute instances stop \
        --project arrikto-playground ${ARR_GCP_MINIKF} \
        --zone=${ARR_GCP_MINIKF_ZONE}
}

function minikf-ssh {
    gcloud compute ssh \
        minikf@$ARR_GCP_MINIKF --zone=$ARR_GCP_MINIKF_ZONE\
        -- -J root@transporter.arr
}

function minikf-k8s {
    # fetch the minikf kubeconfig
    gcloud compute scp --zone=$ARR_GCP_MINIKF_ZONE \
        minikf@$ARR_GCP_MINIKF:/home/minikf/.kube/minikf-kubeconfig \
        $HOME/.kube/config

    # remove tls checks
    kubectl config set-cluster minikf --insecure-skip-tls-verify=true
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
