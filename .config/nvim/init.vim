call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:vim_monokai_tasty_italic = 1

set number
set relativenumber
set so=1000

colorscheme gruvbox
highlight Normal ctermbg=NONE guibg=NONE
