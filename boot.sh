#!/usr/bin/env sh

# DOTFILES=https://github.com/henderjon/dotfiles.git

# cd
# install dotfiles
# git clone $DOTFILES

cd
# set up working dir
mkdir -p ~/code/go/src/github/henderjon
mkdir -p ~/code/go/bin
mkdir -p ~/code/go/pkg

# rc(dot)files
f=.gitconfig # gitconfig
mv ~/$f ~/$f.bkup && ln -s ~/dotfiles/$f ~/$f

f=.screenrc  # screenrc
mv ~/$f ~/$f.bkup && ln -s ~/dotfiles/$f ~/$f

f=.tmux.conf # tmux.conf
mv ~/$f ~/$f.bkup && ln -s ~/dotfiles/$f ~/$f

f=.vim       # vim
mv ~/$f ~/$f.bkup && ln -s ~/dotfiles/$f ~/$f

f=.vimrc     # vimrc
mv ~/$f ~/$f.bkup && ln -s ~/dotfiles/$f ~/$f

f=.zshrc     # zshrc
mv ~/$f ~/$f.bkup && ln -s ~/dotfiles/$f ~/$f

printf ",s/Laptop/$1/\nw\nq\n" | ed .zshrc
touch ~/.evn_zshrc

cd
# generate an ssh key
ssh-keygen -t rsa -C "$2"
