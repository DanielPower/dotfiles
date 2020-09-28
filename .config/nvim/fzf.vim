let $RIPGREP_CONFIG_PATH=$HOME.'/.config/ripgrep'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-vcs'
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

nnoremap <C-p> :Files<CR>
