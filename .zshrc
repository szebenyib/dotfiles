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
alias zsc="vim ~/.zshrc"
alias sps="sudo pacman -S "
alias ls="ls --color=auto"
alias lsl="ls -alh"
alias vim="vim --servername VIM"
alias audi="rdesktop -g 1920x1040 127.0.0.11:3390 -d DEAUDI00 -u v5v6roo -K"
alias audi2="rdesktop -g 1920x1040 127.0.0.13:3390 -d DEAUDI00 -u v5v6roo -K"
alias dmrv="rdesktop -g 1920x1040 127.0.0.2:13389 -K -d DMRV -u szebenyib -r clipboard:PRIMARYCLIPBOARD -r disk:share=/home/szebenyib/win7_link/projektek/rdp_share"
alias audis="rdesktop -g 1364x704 127.0.0.11:3390 -d DEAUDI00 -u v5v6roo -K"
alias audis2="rdesktop -g 1364x704 127.0.0.13:3390 -d DEAUDI00 -u v5v6roo -K"
alias dmrvs="rdesktop -g 1364x704 127.0.0.2:13389 -K -d DMRV -u szebenyib -r clipboard:PRIMARYCLIPBOARD -r disk:share=/home/szebenyib/win7_link/projektek/rdp_share"
alias agcl="sudo pkill -f agclient && sh ~/Dropbox/opsys/arch/sys/appgate/opt/APPGclnt/bin/agclient&"
alias stu="stunnel ~/Dropbox/opsys/arch/sys/stunnel/stunnel.conf"
alias sapgl="sh /opt/SAPClients/SAPGUI7.40rev7/bin/guilogon"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gl="git l"
alias gk="gitk --all"
alias gs="git status"
alias gsu="git status -uno"
alias gd="git diff"
alias gr="git rebase -i"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gm="git merge"
alias gps="git push"
alias gpl="git pull"
alias gf="git fetch"

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv2
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/bin/virtualenvwrapper.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export EDITOR=/usr/bin/vim

##Git slow autocompletion hack
__git_files () {
	_wanted files expl 'local files' _files
}

##Android development
export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk

##NPM global moved under home
export PATH="$HOME/.node_modules_global/bin:$PATH"
