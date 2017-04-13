################ http://zsh.sourceforge.net/Guide/zshguide.html ################

#-------------------------------------------------------------- fancy prompt --#
PROMPT='[Laptop] %# %~/: '

#-------------------------- fancy RIGHT prompt -- '%?[%D{%d %b %Y %l:%M%p}]' --#
RPROMPT='%?[%D{%Y-%m-%d %H:%M:%S}]'

#-------------------------------------------------------------- history file --#
HISTFILE=$HOME/.history

#----------------------------------------------------- history file max size --#
HISTSIZE=15000

#----------------------------------- max number of lines to write to history --#
SAVEHIST=15000

#-------------------------------------- disallow Ctrl-d from exiting windows --#
setopt ignore_eof

#------------------------------------- add to history upon execution vs exit --#
setopt inc_append_history

#------------------------------ do not append command if it matches the last --#
setopt hist_ignore_dups

#------------------------------------- ignore commands that start with space --#
setopt hist_ignore_space

#----------------------------------------------------------- across sessions --#
setopt SHARE_HISTORY

#------------------------------------------------ save timestamps in history --#
setopt extended_history

#--------------- TAB twice to see a list of completions and TAB through them --#
unsetopt menu_complete
setopt auto_list
setopt auto_menu

#------------------------------------ disallow cat-ing over an existing file --#
setopt no_clobber

#--------------------------------- confirm corrections on incorrect commands --#
setopt correct

#------------------------------------------------------- turn on completions --#
autoload -U compinit
compinit

#------------------------------------------ completions are case insensitive --#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'

#-------------------------------------- completion suggestions are colorized --#
zstyle ':completion:*' list-colors ''

#----------------------------- visible tab highlight through completion list --#
zstyle ':completion:*' menu select

#------------------------------------------------------- these are important --#
export EDITOR=ed
export VISUAL=vi
export PAGER=less

#---------------------------------------------------------------- HOME LOCAL --#
export HOMELOCAL=$HOME/local
export GO15VENDOREXPERIMENT=1

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOMELOCAL/bin:$HOMELOCAL/sbin:$PATH
export PATH=$HOME/bin:$PATH
export GOPATH=$HOME/code/go               # points to workspace
export GOROOT=/usr/local/go               # ONLY use for custom install location
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH # must add go bins to path

#---------------------------------------------------------------------- subl --#
# alias subl='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl '
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime

#------------------------------------------------- Alias [`man zshbuiltins`] --#
alias lsl='ls -AFGTl '  # --time-style=+'%b %e %T %Y' ## MacOS, BSD
# alias lsl='ls -AFCl --color ' # --time-style=+'%b %e %T %Y' ## Linux
alias lslh='lsl -h '
alias less='less -S '
alias ed='ed -p :'
alias h='history -25'
alias hall='history 1'
alias psp='ps -eo user,group,pid,comm,args'
alias grep='grep --color '
alias gome='cd $GOPATH/src/github.com/henderjon'

#----------------------------------------------------------------------- IRC --#
export IRCNAME=henderjon
export IRCNICK=henderjon
export IRCUSER=henderjon

#-------------------------------- Optional settings not commited to the repo --#
if [ -f $HOME/.env_zshrc ]; then
	source $HOME/.env_zshrc
fi
