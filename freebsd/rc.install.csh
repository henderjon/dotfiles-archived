

# gitconfig
set f=.gitconfig
mv ~/$f ~/$f.bkup && ln -s $PWD/$f ~/$f

# screenrc
set f=.screenrc
mv ~/$f ~/$f.bkup && ln -s $PWD/$f ~/$f

# conf
set f=.tmux.conf
mv ~/$f ~/$f.bkup && ln -s $PWD/$f ~/$f

# vim
set f=.vim
mv ~/$f ~/$f.bkup && ln -s $PWD/$f ~/$f

# vimrc
set f=.vimrc
mv ~/$f ~/$f.bkup && ln -s $PWD/$f ~/$f

# zshrc
set f=.zshrc
mv ~/$f ~/$f.bkup && ln -s $PWD/$f ~/$f


printf ",s/Laptop/$1/\nw\nq\n" | ed .zshrc
