#!/usr/bin/env bash

# DOTFILES=https://github.com/henderjon/dotfiles.git

# cd
# install dotfiles
# git clone $DOTFILES

confirm(){
	CONT=0
	read -r -p "$1 (y/n)? " </dev/tty CHOICE
	case "$CHOICE" in
	  y|Y ) CONT=1;;
	  n|N ) CONT=0;;
	  * ) CONT=0;;
	esac
	echo "$CONT";
}

cd || exit

RESULT="$(confirm "create code dirs")"
if [ "$RESULT" -gt 0 ]; then
	# set up working dir
	mkdir -p ~/code/go/bin ~/code/go/pkg ~/code/go/src/github.com/henderjon
fi

RESULT="$(confirm "link dot files")"
if [ "$RESULT" -gt 0 ]; then
	# rc(dot)files
	FILES=".gitconfig .screenrc .tmux.conf .vim .vimrc .zshrc"
	for f in $FILES
	do
		if [ -f "$f" ]; then mv ~/"$f" ~/"$f.bkup"; else rm "$f"; fi
		ln -s ~/dotfiles/"$f" ~/"$f"
	done
fi


cd || exit

RESULT="$(confirm "create ssh key")"
if [ "$RESULT" -gt 0 ]; then
	read -r -p "name this key: " </dev/tty KEY
	# generate an ssh key
	ssh-keygen -t rsa -C "$KEY"
fi

touch ~/.env_zshrc
read -r -p "name this env: " </dev/tty NAME
echo "ENV_NAME=\"$NAME\"" >> ~/.env_zshrc

# http://www.shellcheck.net/
source ~/.zshrc


