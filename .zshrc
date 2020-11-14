export EDITOR=nvim
export VISUAL=nvim
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
antigen bundle lukechilds/zsh-nvm
antigen bundle mattberther/zsh-pyenv
antigen bundle reobin/typewritten@main
antigen apply
