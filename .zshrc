# XDG Dirs
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Path Environment Variables
export EDITOR=nvim
export VISUAL=nvim
export DIFFPROG="nvim -d"
export NVM_DIR="$HOME/.nvm"
export GOPATH="$HOME/.go"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"
export PATH="/usr/local/sbin:$PATH" # Brew
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep"

# Configuration Environment Variables
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

# Aliases
alias :G=git
alias tt="task add due:today"

# ZSH Options
setopt HISTIGNORESPACE
HISTFILE=$HOME/.zhistory
HYPHEN_INSENSITIVE="true"
SAVEHIST=1000000
TYPEWRITTEN_PROMPT_LAYOUT="pure"

# ZSH Plugins
source $HOME/.antigen/antigen.zsh
antigen bundle lukechilds/zsh-nvm
antigen bundle mattberther/zsh-pyenv
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle reobin/typewritten@main
antigen bundle jeffreytse/zsh-vi-mode
antigen apply

if [[ -f "$HOME/.local.zsh" ]]; then
  source "$HOME/.local.zsh"
fi
