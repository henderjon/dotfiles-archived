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
	# rm links
	if [ -h $HOME/$f ]; then
		printf "rm %s/%s %s/%s.bkup\n" $HOME $f
		rm $HOME/$f
	fi

	# create backups or *real* files
	if [ -f $HOME/$f ]; then
		printf "mv %s/%s %s/%s.bkup\n" $HOME $f $HOME $f
		mv $HOME/$f $HOME/$f.bkup
	fi

	# create links to new files
	printf "ln -s %s/%s %s/%s\n" $HERE $f $HOME $f
	ln -s $HERE/$f $HOME/$f

done

printf ",s/Laptop/$1/\nw\nq\n" | ed .zshrc
