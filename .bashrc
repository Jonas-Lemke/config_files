### Bash history ###

# ignore duplicate commands in history
HISTCONTROL=ignoredups

# append to history file, dont overwrite it
shopt -s histappend

# buffer and file size
HISTSIZE=1000
HISTFILESIZE=2000


### Other ### 

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set default editor to vim 
# (setting default editor streamlines workflows 
# like editing cron entries or handling git commit messages)
export EDITOR='vim'

### Colors ###

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# store colors
red="\[\e[0;31m\]"
RED="\[\e[1;31m\]"
blue="\[\e[0;34m\]"
BLUE="\[\e[1;34m\]"
cyan="\[\e[0;36m\]"
CYAN="\[\e[1;36m\]"
NC="\[\033[0m\]"      # no color
black="\[\e[0;30m\]"
BLACK="\[\e[1;30m\]"
green="\[\e[0;32m\]"
GREEN="\[\e[1;32m\]"
yellow="\[\e[0;33m\]"
YELLOW="\[\e[1;33m\]"
magenta="\[\e[0;35m\]"
MAGENTA="\[\e[1;35m\]"
white="\[\e[0;37m\]"
WHITE="\[\e[1;37m\]"

color_my_prompt() {
  local __user_and_host="$GREEN\u@\h"
  local __separator="$WHITE:"
  local __cur_location="$BLUE\w"           # capital 'W': current directory, small 'w': full file path
  local __git_branch="$RED\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"
  local __prompt_tail="$WHITE$"
  local __user_input_color="$white"
   
  # Build PS1 (Prompt String)
  PS1="${debian_chroot:+($debian_chroot)}$__user_and_host$__separator$__cur_location$__git_branch $__prompt_tail $__user_input_color"
}
color_my_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

### PATH variable modifications ###

# export PATH="$PATH:/...
# export PATH="$HOME/...
