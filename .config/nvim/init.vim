call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'sainnhe/sonokai' " Color Scheme
Plug 'dense-analysis/ale' " Linting Engine
Plug 'preservim/nerdtree' " File Tree
Plug 'tpope/vim-fugitive' " Vim Integration
Plug 'sbdchd/neoformat' " Autoformatter
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim' " Fuzzy find
call plug#end()

filetype plugin on

set termguicolors
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_enable_italic_comment = 1
colorscheme sonokai

" Display whitespace wharacters
set listchars+=space:·
set listchars+=trail:·
set listchars+=tab:›-
set list

" Line numbers
set number
set relativenumber
set so=10
set cursorline

" Better mouse scrolling
set mouse=a

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

command! -bang -nargs=0 Gcheckout call <SID>show_branches_fzf(<bang>0)

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

