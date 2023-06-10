FROM ubuntu:22.04

ENV USER=root

RUN apt update && apt install -y vim git curl wget bash-completion

RUN mkdir -p /root/.local/bin

WORKDIR /root/dotfiles

# nodejs
COPY ./scripts/nodejs.sh ./scripts/
RUN /root/dotfiles/scripts/nodejs.sh

# docker
COPY ./scripts/docker.sh ./scripts/
RUN /root/dotfiles/scripts/docker.sh

# golang
COPY ./scripts/golang.sh ./scripts/
RUN /root/dotfiles/scripts/golang.sh

# tmux
COPY ./scripts/tmux/* ./scripts/tmux/
COPY ./tmux.conf .
RUN /root/dotfiles/scripts/tmux/tmux.sh

# k8s clis
COPY ./scripts/k8s.sh ./scripts/
RUN /root/dotfiles/scripts/k8s.sh

# vim
COPY ./scripts/vim/* ./scripts/vim/
COPY ./vimrc .
RUN /root/dotfiles/scripts/vim/vim.sh
RUN /root/dotfiles/scripts/vim/ale.sh

# bash
COPY ./scripts/bash.sh ./scripts/
COPY ./bashrc .
RUN /root/dotfiles/scripts/bash.sh

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Docker in Docker
RUN apt install -y kmod btrfs-progs e2fsprogs iptables xfsprogs \
    iproute2 pigz fuse-overlayfs uidmap
#RUN update-alternatives --set iptables /usr/sbin/iptables-legacy
#RUN update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

COPY ./scripts/dind.sh ./scripts/
RUN /root/dotfiles/scripts/dind.sh
RUN cp /tmp/modprobe.sh /usr/local/bin/modprobe
RUN cp /tmp/dockerd-entrypoint.sh /usr/local/bin/
RUN cp /tmp/docker-entrypoint.sh /usr/local/bin/
RUN cp /tmp/dind /usr/local/bin/

ENV DOCKER_TLS_CERTDIR=/certs
RUN mkdir /certs /certs/client && chmod 1777 /certs /certs/client
VOLUME /var/lib/docker
EXPOSE 2375 2376

# Run your program under Tini
#ENTRYPOINT ["/tini", "--"]
ENTRYPOINT ["dockerd-entrypoint.sh"]
#CMD ["/bin/bash"]
