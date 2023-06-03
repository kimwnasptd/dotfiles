FROM ubuntu:22.04

RUN apt update && apt install -y vim git curl

RUN git clone https://github.com/kimwnasptd/dotfiles
RUN cd dotfiles/scripts
ENV USER=root
RUN /bin/bash setup.sh
