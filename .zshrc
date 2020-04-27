export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER=$USER
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export EDITOR=nvim
export VISUAL=nvim
# TODO figure out how to properly use keychain or an alternative
# eval "$(keychain --eval --quiet github gitlab)"

# Macbook only
function morning() {
  displayplacer "id:215C6D27-7AFC-FB6A-DCAE-0761562F9D34 res:1440x900 color_depth:4 scaling:on origin:(0,0) degree:0" "id:CABC5EF8-8F1F-9683-A702-B301991DB372 res:1920x1080 hz:60 color_depth:8 scaling:off origin:(1440,-180) degree:0" "id:C0731C3E-39D1-CC66-C1B1-91B1E609FB22 res:1920x1080 hz:60 color_depth:8 scaling:off origin:(3360,-180) degree:0"
}

function gcheckout() {
  git checkout $(git branch --all | fzf)
}

if [ $TERM != "linux" ]
then
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

ZLE_RPROMPT_INDENT=0
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting nvm pyenv)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Vim Mode
export KEYTIMEOUT=1
bindkey -v
bindkey "^?" backward-delete-char

# Fix for incorrect behavior on keys such as Home/End when using vi mode
# Taken from Arch Wiki
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Change Directory with fzf
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Aliases

# Git
alias ga='git add'
alias gc='git checkout'
alias gs='git status'
alias gc='git commit'
alias gb='git branch'
