export ZSH="/home/daniel/.oh-my-zsh"
export DEFAULT_USER=$USER
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
eval "$(pyenv virtualenv-init -)"

alias ipm=/usr/lib/inkdrop/resources/app/ipm/bin/ipm

if [ $TERM != "linux" ]
then
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi

ZLE_RPROMPT_INDENT=0
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
