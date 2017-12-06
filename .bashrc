# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias sudo='sudo '

export EDITOR=micro
export MICRO_TRUECOLOR=1
export GOPATH="/home/daniel/.go"
export GOBIN="/home/daniel/.go/bin"
