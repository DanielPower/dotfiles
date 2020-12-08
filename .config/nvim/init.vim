call plug#begin('~/.config/nvim/plugged')
Plug 'danielpower/sonokai' " Colorscheme
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'itchyny/lightline.vim' " Statusbar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy find
Plug 'junegunn/fzf.vim' " Fuzzy find
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language Server Integration
Plug 'sheerun/vim-polyglot' " Syntax Highlighting
Plug 'tpope/vim-fugitive' " Git Integration
Plug 'tpope/vim-sleuth' " Detect Indentation
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'tpope/vim-surround'
Plug 'ron-rs/ron.vim'
Plug 'vimwiki/vimwiki' " Wiki
Plug 'tpope/vim-commentary'

Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-marketplace', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rls', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-deno', {'do': 'yarn install --frozen-lockfile'}
call plug#end()

"" Plugin Configurations
source $HOME/.config/nvim/localvimrc.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/coc_explorer.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/sonokai.vim
source $HOME/.config/nvim/vimwiki.vim

let g:rustfmt_autosave = 1

filetype on
filetype plugin on

" Appearance
set termguicolors
set guifont="JetBrains Mono Regular"
set nowrap
set colorcolumn=88,100
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

" Git Checkout
nnoremap <leader>gz :GCheckout<CR>

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

" Escape exits terminal mode
au TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
au FileType fzf tunmap <buffer> <Esc>

" Clear search highlight on Esc
nnoremap <esc> :noh<return><esc>
