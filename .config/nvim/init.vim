call plug#begin('~/.config/nvim/plugged')
Plug 'embear/vim-localvimrc'
Plug 'danielpower/sonokai' " Colorscheme
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'itchyny/lightline.vim' " Statusbar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim' " Fuzzy find
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language Server Integration
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'tpope/vim-fugitive' " Git Integration
Plug 'tpope/vim-sleuth' " Detect Indentation
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'tpope/vim-surround'
Plug 'ron-rs/ron.vim'
Plug 'vimwiki/vimwiki' " Wiki
Plug 'tpope/vim-commentary'
call plug#end()

"" Plugin Configurations
source $HOME/.config/nvim/localvimrc.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/coc_explorer.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/sonokai.vim
source $HOME/.config/nvim/vimwiki.vim
source $HOME/.config/nvim/snippets.vim

let g:rustfmt_autosave = 1

filetype plugin on

" Appearance
set termguicolors
set guifont="JetBrains Mono Regular"
colorscheme sonokai
set nowrap

let mapleader = " "

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

" Show Symbols
nnoremap <C-s> :CocList symbols<CR>

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

" Clear search highlight on Esc
nnoremap <esc> :noh<return><esc>
