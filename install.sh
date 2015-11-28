#!/usr/bin/env bash

FILES[1]=.gitconfig
FILES[2]=.screenrc
FILES[3]=.tmux.conf
FILES[4]=.vim
FILES[5]=.vimrc
FILES[6]=.zshrc

HERE=`pwd`

for f in ${FILES[@]}
do
	# f2="${f##*/}"
	printf "mv %s/%s %s/%s.bkup\n" $HOME $f $HOME $f
	mv $HOME/$f $HOME/$f.bkup

	printf "ln -s %s/%s %s/%s\n" $HERE $f $HOME $f
	ln -s $HERE/$f $HOME/$f
done
