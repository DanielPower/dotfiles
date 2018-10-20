[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

alias ls='ls --color=auto'
alias sudo='sudo '

export EDITOR=vim
