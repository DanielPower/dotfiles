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
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep"

# ZSH Options
setopt HISTIGNORESPACE
HISTFILE=$HOME/.zhistory
HYPHEN_INSENSITIVE="true"
SAVEHIST=1000000
TYPEWRITTEN_PROMPT_LAYOUT="pure"

# ZSH Plugins
source $HOME/.antigen/antigen.zsh
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle reobin/typewritten@main
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle mattberther/zsh-pyenv

# Autosuggestion Navigation
function zvm_after_lazy_keybindings() {
  zvm_bindkey vicmd "^[[A" history-beginning-search-backward
  zvm_bindkey vicmd "k" history-beginning-search-backward
  zvm_bindkey vicmd "^[[B" history-beginning-search-forward
  zvm_bindkey vicmd "j" history-beginning-search-forward
}
function zvm_after_init() {
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
}

export PATH="$HOME/.local/bin:$PATH"

[[ -f "$HOME/.local.zsh" ]] && source "$HOME/.local.zsh"

antigen apply
