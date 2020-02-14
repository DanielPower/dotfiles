call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
call plug#end()

filetype plugin on

" CtrlP
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*

" Display whitespace wharacters
set listchars+=space:·
set listchars+=trail:·
set listchars+=tab:›-
set list

" Line numbers
set number
set relativenumber
set so=1000

autocmd BufWritePre *.{js,c} Neoformat

colorscheme monokai_pro

nnoremap <esc> :noh<return><esc>
