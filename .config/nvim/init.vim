call plug#begin('~/.config/nvim/plugged')
Plug 'dense-analysis/ale' " Linting Engine
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'itchyny/lightline.vim' " Statusbar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim' " Fuzzy find
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language Server Integration
Plug 'preservim/nerdtree' " File Tree
Plug 'sainnhe/sonokai' " Color Scheme
Plug 'sbdchd/neoformat' " Autoformatter
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'tpope/vim-fugitive' " Git Integration
Plug 'tpope/vim-sleuth' " Detect Indentation
Plug 'vimwiki/vimwiki' " Wiki
call plug#end()

"" Plugin Configurations
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/vimwiki.vim

filetype plugin on

" Appearance
set termguicolors
set guifont="JetBrains Mono Regular"
let mapleader=" "
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_enable_italic_comment = 1
colorscheme sonokai

" Split Direction
set splitbelow splitright

" Move Between and Close Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-C> <C-w>c

" Resize Splits
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Change Split Direction
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Move Lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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

" Indentation
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" Better mouse scrolling
set mouse=a

" Search and Replace
set ignorecase
set smartcase

" Autoformat on save
autocmd BufWritePre *.{js,jsx,ts,tsx,lua,c} Neoformat

" Clear search highlight on Esc
nnoremap <esc> :noh<return><esc>

" Lightline
let g:lightline = {
  \ 'colorscheme': 'sonokai',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'filename', 'readonly', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ] ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \ },
  \ 'mode_map': {
  \   'n': 'N',
  \   'i': 'I',
  \   'R': 'R',
  \   'v': 'V',
  \   'V': 'VL',
  \   "\<C-v": 'VB',
  \   'c': 'C',
  \   's': 'S',
  \   'S': 'SL',
  \   "\<C-s>": 'SB',
  \   't': 'T',
  \ },
\ }

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
