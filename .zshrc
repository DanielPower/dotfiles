export DEFAULT_USER=$USER
export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
export VISUAL=nvim
DISABLE_UNTRACKED_FILES_DIRTY="true"
HISTFILE=$HOME/.zhistory
HYPHEN_INSENSITIVE="true"
SAVEHIST=1000
ZLE_RPROMPT_INDENT=0

# ZSH Plugins
source $HOME/.antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-nvm
antigen bundle pyenv
antigen theme denysdovhan/spaceship-prompt
antigen apply

# Change Directory with fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Prompt Configuration
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_PROMPT_ORDER=(
  dir
  git
  char
)

SPACESHIP_RPROMPT_ORDER=(
  node
  rust
  pyenv
  exit_code
)

# Git Checkout with fzf
function gcheckout() {
  local branches branch
  branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

task next
