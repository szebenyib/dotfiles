# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/szebenyib/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#Based on: gnzh, agnoster

## Aliases
alias zsc="vim -c ~/.zshrc"
alias sps="sudo pacman -S "
alias ls="ls --color=auto"
alias lsl="ls -al"
alias vim="vim --servername VIM"

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv2
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# Needed by virtualenvwrapper python2
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv2
export EDITOR=/usr/bin/vim

##Git slow autocompletion hack
__git_files () {
	_wanted files expl 'local files' _files
}
