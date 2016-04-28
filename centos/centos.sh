#!/usr/bin/env bash

GOLANGV=https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
DOTFILES=https://github.com/henderjon/dotfiles.git

yum install vim git ed zsh tmux iptables sudo ntp ntpdate ntp-doc

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

cd
# generate an ssh key
ssh-keygen -t rsa -C "$2"

cd
# install the firewall
iptables-restore < ~/dotfiles/centos/iptables.restore
iptables -L

cd
# install ntp
/etc/init.d/ntpd start

# rc(dot)files
sh ~/dotfiles/freebsd/rc.install.bash $1
