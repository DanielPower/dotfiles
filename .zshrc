export DEFAULT_USER=$USER
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
ZLE_RPROMPT_INDENT=0
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HISTFILE=$HOME/.zhistory
SAVEHIST=1000

# Disable vi mode from prompt
set -o emacs

# ZSH Plugins
source $HOME/.antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-nvm
antigen bundle pyenv
antigen theme denysdovhan/spaceship-prompt
antigen apply

# Prompt Configuration
SPACESHIP_PROMPT_PREFIXES_SHOW=false
SPACESHIP_CHAR_SUFFIX=" "
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

# Change Directory with fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Git Checkout with fzf
function gcheckout() {
  local branches branch
  branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
