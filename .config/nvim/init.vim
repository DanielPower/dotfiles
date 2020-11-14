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
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'neovim/nvim-lspconfig'
call plug#end()

"" Plugin Configurations
source $HOME/.config/nvim/localvimrc.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/coc_explorer.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/sonokai.vim
source $HOME/.config/nvim/vimwiki.vim

" lua << EOF
" require'nvim_lsp'.tsserver.setup{}
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"   },
" }
" EOF

" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

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
