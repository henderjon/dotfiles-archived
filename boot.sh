#!/usr/bin/env bash

# DOTFILES=https://github.com/henderjon/dotfiles.git

# cd
# install dotfiles
# git clone $DOTFILES

if [ -z "$1" ]; then
	printf "please provide a name\n"
	exit 1
fi

if [ -z "$2" ]; then
	printf "please provide an email\n"
	exit 1
fi

cd
# set up working dir
mkdir -p ~/code/go/bin ~/code/go/pkg ~/code/go/src/github/henderjon

# rc(dot)files
FILES=".gitconfig .screenrc .tmux.conf .vim .vimrc .zshrc"
for f in $FILES
do
	if [ ! -h "$f" ]; then mv ~/"$f" ~/"$f.bkup"; else rm "$f"; fi
	ln -s ~/dotfiles/"$f" ~/"$f"
done

sed -i 's/Laptop/$1/' .zshrc
touch ~/.env_zshrc

cd
# generate an ssh key
ssh-keygen -t rsa -C "$2"

# http://www.shellcheck.net/

