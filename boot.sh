#!/usr/bin/env bash

# DOTFILES=https://github.com/henderjon/dotfiles.git

# cd
# install dotfiles
# git clone $DOTFILES

if [ -z "$1" ] || [ -z "$2" ]; then
	printf "please provide two args: a name for this machine and an email for your ssh key\n"
	exit 1
fi

cd || exit
# set up working dir
mkdir -p ~/code/go/bin ~/code/go/pkg ~/code/go/src/github.com/henderjon

# rc(dot)files
FILES=".gitconfig .screenrc .tmux.conf .vim .vimrc .zshrc"
for f in $FILES
do
	if [ -f "$f" ]; then mv ~/"$f" ~/"$f.bkup"; else rm "$f"; fi
	ln -s ~/dotfiles/"$f" ~/"$f"
done

sed -i "" "s/Laptop/$1/" ~/dotfiles/.zshrc
touch ~/.env_zshrc

cd || exit
# generate an ssh key
ssh-keygen -t rsa -C "$2"

# http://www.shellcheck.net/

source ~/.zshrc

