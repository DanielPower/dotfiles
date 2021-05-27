require('plugins')

-- Aliases
local api = vim.api -- Nvim api
local cmd = vim.cmd  -- Execute vim commands
local g = vim.g -- Global variables
local o = vim.o -- Global options
local bo = vim.bo -- Buffer-scoped options
local wo = vim.wo -- Window-scoped options

-- Options
cmd "colorscheme tokyonight"
cmd "set listchars+=space:·"
cmd "set listchars+=space:·"
cmd "set listchars+=tab:›-"
cmd "set shortmess+=I"
cmd("set ts=4")
cmd("set sw=4")
cmd("set expandtab")
g.mapleader = " "
bo.smartindent = true
wo.colorcolumn = '88,100'
o.cursorline = true
o.hidden = true
o.ignorecase = true
o.mouse = 'a'
wo.number = true
wo.relativenumber = true
o.smartcase = true
o.smarttab = true
o.so = 10
o.splitbelow = true
o.splitright = true
o.termguicolors = true
wo.wrap = false
wo.list = true

-- Move Between and Close Splits
api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-C>', ':close<CR>', { noremap = true, silent = true })

-- Move Lines
api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true })

-- Clear search highlight on Esc
api.nvim_set_keymap('n', '<esc>', ':noh<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

-- LSP Diagnostics
api.nvim_set_keymap('n', '<leader>x', ':LspTrouble<CR>', { noremap = true, silent = true })
