export EDITOR=nvim
export VISUAL=nvim
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
HISTFILE=$HOME/.zhistory
HYPHEN_INSENSITIVE="true"
SAVEHIST=1000
ZLE_RPROMPT_INDENT=0

# ZSH Plugins
source $HOME/.antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle reobin/typewritten@main
antigen bundle jeffreytse/zsh-vi-mode
antigen apply

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  XKB_DEFAULT_LAYOUT=us exec sway
fi

eval "$(pyenv init -)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
