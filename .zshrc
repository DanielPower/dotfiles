# Path Environment Variables
export EDITOR=nvim
export VISUAL=nvim
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/.go"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export PATH="/usr/local/sbin:$PATH" # Brew

# Configuration Environment Variables
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

# ZSH Options
setopt HISTIGNORESPACE
HISTFILE=$HOME/.zhistory
HYPHEN_INSENSITIVE="true"
SAVEHIST=1000
ZLE_RPROMPT_INDENT=0
TYPEWRITTEN_PROMPT_LAYOUT="pure"

# ZSH Plugins
source $HOME/.antigen/antigen.zsh
antigen bundle lukechilds/zsh-nvm
antigen bundle mattberther/zsh-pyenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle reobin/typewritten@main
antigen bundle jeffreytse/zsh-vi-mode
antigen apply

# Sway Window Manager
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  XKB_DEFAULT_LAYOUT=us exec sway
fi
