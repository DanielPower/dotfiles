call plug#begin('~/.config/nvim/plugged')
Plug 'editorconfig/editorconfig-vim' " Editorconfig support
Plug 'hoob3rt/lualine.nvim'
Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' " Git Integration
Plug 'tpope/vim-sleuth' " Detect Indentation
Plug 'tpope/vim-surround'
call plug#end()

"" Plugin Configurations
lua require('treesitter_setup')
lua require('telescope_setup')
lua require('lualine_setup')
lua require('lspconfig_setup')

let g:rustfmt_autosave = 1
let g:svelte_preprocessors = ['typescript']
let g:svelte_preprocessor_tags = [
      \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' }
      \ ]

filetype on
filetype plugin on

nnoremap <C-_> :NvimTreeToggle<CR>

" Appearance
set termguicolors
set guifont="JetBrains Mono Regular"
set nowrap
set colorcolumn=88,100
colorscheme onedark
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
