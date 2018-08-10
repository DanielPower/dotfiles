# If not running interactively, don't do anything
# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias sudo='sudo '

export EDITOR=micro
export MICRO_TRUECOLOR=1
export GOPATH="/home/daniel/.go"
export GOBIN="/home/daniel/.go/bin"
