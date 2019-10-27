export ZSH="/home/daniel/.oh-my-zsh"
export DEFAULT_USER=$USER

if [ $TERM != "linux" ]
then
    ZSH_THEME="agnoster"
fi

ZLE_RPROMPT_INDENT=0
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
