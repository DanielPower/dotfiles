require('plugins')
require('treesitter_setup')
require('telescope_setup')
require('lualine_setup')
require('lspconfig_setup')
require('nvim_tree_setup')
require('nvim_compe_setup')
require('nvim_comment_setup')
require('lspsaga_setup')

-- Aliases
local api = vim.api -- Nvim api
local cmd = vim.cmd  -- Execute vim commands
local fn = vim.fn -- Vim functions
local g = vim.g -- Global variables
local o = vim.o -- Global options
local bo = vim.bo -- Buffer-scoped options
local wo = vim.wo -- Window-scoped options

-- Options
cmd "colorscheme tokyonight"
cmd "set listchars+=space:·"
cmd "set listchars+=space:·"
cmd "set listchars+=tab:›-"
g.mapleader = " "
bo.expandtab = true
bo.shiftwidth = 2
bo.smartindent = true
bo.tabstop = 2
o.colorcolumn = '88,100'
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
