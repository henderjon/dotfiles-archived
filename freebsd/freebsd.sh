#!/usr/bin/env sh

GOLANGV=https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz
DOTFILES=https://github.com/henderjon/dotfiles.git

cd
# all the cool kids use pkg now
pkg update

cd
# ... but we still want ports around
portsnap fetch extract

cd
# install the userful tools
pkg install vim git zsh tmux ipfw

cd
# firewall
cat ~/dotfiles/freebsd/ipfw.txt >> /etc/rc.conf
service ipfw start
service ntpd start
printf "net.inet.ip.fw.verbose_limit=5" >> /etc/sysctl.conf
sysctl net.inet.ip.fw.verbose_limit=5

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

# rc(dot)files
sh ~/dotfiles/freebsd/rc.install.csh $1
