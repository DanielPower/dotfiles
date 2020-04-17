call plug#begin('~/.config/nvim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin on

set termguicolors
colorscheme monokai_pro

" Display whitespace wharacters
set listchars+=space:·
set listchars+=trail:·
set listchars+=tab:›-
set list

" Line numbers
set number
set relativenumber
set so=1000

" Search and Replace
set ignorecase
set smartcase

" Autoformat on save
autocmd BufWritePre *.{js,jsx,ts,tsx,c} Neoformat

" Clear search highlight on Esc
nnoremap <esc> :noh<return><esc>

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
    \ "git branch -a", 0,
    \ { 'sink': function('s:open_branch_fzf'), 'options': ['--no-multi', '--header='.l:current] }, a:bang)
endfunction

" Fuzzy Find on Ctrl-P
function! s:gfiles()
  let l:in_git = system('git rev-parse --is-inside-work-tree')
  if l:in_git == "true\n"
    :GFiles
  else
    :Files
  endif
endfunction

map <C-p> :call <SID>gfiles()<return>

command! -bang -nargs=0 FzGCheckout call <SID>show_branches_fzf(<bang>0)

let g:deoplete#enable_at_startup = 1
