#!/usr/bin/env bash

GOLANGV=https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
DOTFILES=git@github.com:henderjon/dotfiles.git

yum install vim git ed zsh tmux iptables sudo

cd
# set up working dir
mkdir -p ~/code/go/src/github/henderjon
mkdir -p ~/code/go/bin
mkdir -p ~/code/go/pkg

cd
# install golang
wget $GOLANGV
tar -C /usr/local -xvf $GOLANGV

cd
# install dotfiles
git clone $DOTFILES
cd dotfiles
sh ./install.sh $1

cd
# generate an ssh key
ssh-keygen -t rsa -C "$2"

cd
# install the firewall
iptables-restore < ~/dotfiles/centos/iptables.restore
iptables -L
