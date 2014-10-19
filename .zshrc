# Lines configured by zsh-newuser-install
HISTFILE=~/.zshrc_history
HISTSIZE=5000
SAVEHIST=5000
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

## Use Prompt
autoload -U promptinit
autoload -U colors
promptinit
colors

# Set Variables
# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_FG$color="%{$fg[${(L)color}]%}"
  eval PR_BG$color="%{$bg[${(L)color}]%}"
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

# Check the UID
if [[ $UID -ge 1000 ]]; then # normal user
  local PR_PROMPT_BEGIN="$PR_NO_COLOR$PR_NO_COLOR"
  eval PR_USER="${PR_BGBLUE}%n@${PR_NO_COLOR}"
  eval PR_USER_OP="${PR_BGBLUE}\ %#${PR_NO_COLOR}"
  eval PR_BRACKET_OPEN="${PR_BGBLUE}[${PR_NO_COLOR}"
  eval PR_BRACKET_CLOSE="${PR_BGBLUE}]${PR_NO_COLOR}"
  local PR_PROMPT_END="$PR_FGBLUE$PR_NO_COLOR "
elif [[ $UID -eq 0 ]]; then # root
  local PR_PROMPT_BEGIN="${PR_BGRED}${PR_NO_COLOR}"
  eval PR_USER="${PR_BGRED}%n${PR_BGBLUE}@${PR_NO_COLOR}"
  eval PR_USER_OP="${PR_BGBLUE}\ %#${PR_NO_COLOR}"
  eval PR_BRACKET_OPEN="${PR_BGBLUE}[${PR_NO_COLOR}"
  eval PR_BRACKET_CLOSE="${PR_BGBLUE}]${PR_NO_COLOR}"
  local PR_PROMPT_END="${PR_FGRED}${PR_NO_COLOR} "
fi
# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then # SSH
	if [[ `hostname -s` = saturn ]];
	then
		eval PR_HOST="${PR_BGGREEN}%M${PR_NO_COLOR}"
	else
		eval PR_HOST="${PR_BGYELLOW}%M${PR_NO_COLOR}"
	fi
else
  eval PR_HOST="${PR_BGBLUE}%M${PR_NO_COLOR}" # no SSH
fi

# Set Prompt
RPROMPT="%*"
PROMPT="%d
${PR_BRACKET_OPEN}${PR_USER}${PR_HOST}${PR_USER_OP}${PR_BRACKET_CLOSE}$PR_PROMPT_END"
#Cursor
#echo -ne "\033]12;#4E9A06\007"
##

export WORKON_HOME=$HOME/.virtualenvs 
export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv2
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
source /usr/bin/virtualenvwrapper.sh 
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export EDITOR=/usr/bin/vim
