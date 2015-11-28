#-- http://zsh.sourceforge.net/Guide/zshguide.html

#-- fancy prompt
#----------------------------------------------------------------------#
PROMPT='[%HOST%] %# %~/: '

#-- fancy RIGHT prompt -- '%?[%D{%d %b %Y %l:%M%p}]'
#----------------------------------------------------------------------#
RPROMPT='%?[%D{%Y-%m-%d %H:%M:%S}]'

#-- history file
#----------------------------------------------------------------------#
HISTFILE=$HOME/.history

#-- history file max size
#----------------------------------------------------------------------#
HISTSIZE=1500

#-- max numberr of lines to write to history
#----------------------------------------------------------------------#
SAVEHIST=1500

#-- disallow Ctrl-d from exiting windows
#----------------------------------------------------------------------#
setopt ignore_eof

#-- add to history upon execution vs exit
#----------------------------------------------------------------------#
setopt inc_append_history

#-- do not append command if it matches the last
#----------------------------------------------------------------------#
setopt hist_ignore_dups

#-- save timestamps in history
#----------------------------------------------------------------------#
setopt extended_history

#-- TAB twice to see a list of completions and TAB through them
#----------------------------------------------------------------------#
unsetopt menu_complete
setopt auto_list
setopt auto_menu

#-- disallow cat-ing over an existing file
#----------------------------------------------------------------------#
setopt no_clobber

#-- confirm corrections on incorrect commands
#----------------------------------------------------------------------#
setopt correct

#-- turn on completions
#----------------------------------------------------------------------#
autoload -U compinit
compinit

#-- completions are case insensitive
#----------------------------------------------------------------------#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'

#-- completion suggestions are colorized
#----------------------------------------------------------------------#
zstyle ':completion:*' list-colors ''

#-- these are important
#----------------------------------------------------------------------#
export EDITOR=ed
export VISUAL=vi
export PAGER=less

#-- HOME LOCAL
#----------------------------------------------------------------------#
export HOMELOCAL=$HOME/local
export GOROOT=$HOMELOCAL/go   # required for custom install location
export GOPATH=$HOME/Sites/go  # points to workspace
export PATH=$HOMELOCAL/bin:$HOMELOCAL/sbin:$PATH
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export PATH=/usr/local/bin:$PATH

#-- subl
#----------------------------------------------------------------------#
# alias subl='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl '
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

#-- Alias
#----------------------------------------------------------------------#
alias lsl='ls -AFGhlT'
alias ed='ed -p :'
alias h='history -25'
alias hall='history 1'
alias grep='grep --color -n '
alias gome='cd $GOPATH/src/github.com/henderjon'
alias gitbd='git log --format="%h (%an) --  %s " '

#-- IRC
#----------------------------------------------------------------------#
export IRCNAME=henderjon
export IRCNICK=henderjon
export IRCUSER=henderjon

#-- Optional settings not commited to the repo
#----------------------------------------------------------------------#
if [ -f .env_zshrc ]; then
	source .env_zshrc
fi
