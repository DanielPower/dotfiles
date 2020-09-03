let $RIPGREP_CONFIG_PATH=$HOME.'/.config/ripgrep'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-vcs'
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

map <C-p> :Files<CR>

" Git Checkout using fzf
" Taken from https://github.com/stsewd/dotfiles/blob/7a9a8972c8a994abf42d87814980dc92cdce9a22/config/nvim/init.vim#L419-L434
function! s:open_branch_fzf(line)
  let l:branch = a:line
  execute 'split | terminal git checkout ' . l:branch
  call feedkeys('i', 'n')
endfunction

function! s:show_branches_fzf(bang)
  let l:current = system('git symbolic-ref --short HEAD')
  let l:current = substitute(l:current, '\n', '', 'g')
  call fzf#vim#grep(
    \ "git branch -l", 0,
    \ { 'sink': function('s:open_branch_fzf'), 'options': ['--no-multi', '--header='.l:current] }, a:bang)
endfunction

command! -bang -nargs=0 Gcheckout call <SID>show_branches_fzf(<bang>0)

