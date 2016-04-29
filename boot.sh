#!/usr/bin/env bash

# DOTFILES=https://github.com/henderjon/dotfiles.git

# cd
# install dotfiles
# git clone $DOTFILES

cd
# set up working dir
mkdir -p ~/code/go/bin ~/code/go/pkg ~/code/go/src/github/henderjon

# rc(dot)files
FILES=".gitconfig .screenrc .tmux .vim .vimrc .zshrc"
for f in $FILES
do
	if [ ! -h "$f" ]; then mv ~/"$f" ~/"$f.bkup"; else rm "$f"; fi
	ln -s ~/dotfiles/"$f" ~/"$f"
done

printf ",s/Laptop/$1/\nw\nq\n" | ed .zshrc
touch ~/.evn_zshrc

cd
# generate an ssh key
ssh-keygen -t rsa -C "$2"

# http://www.shellcheck.net/

