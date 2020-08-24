export DEFAULT_USER=$USER
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
export PYENV_VIRTUALENV_DISABLE_PROMPT=0
ZLE_RPROMPT_INDENT=0
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HISTFILE=$HOME/.zhistory
SAVEHIST=1000

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

# Git Checkout with fzf
function gcheckout() {
  local branches branch
  branches=$(git for-each-ref --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

task next
