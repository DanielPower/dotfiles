-- Aliases
local api = vim.api -- Nvim api
local fn = vim.fn
local g = vim.g
local loop = vim.loop
local opt = vim.opt -- Helper for vim configurations

-- Globals
Keymap = require("util.keymap")

-- Options
g.mapleader = " "
g.python3_host_prog = "/home/daniel/.pyenv/versions/neovim/bin/python3"
opt.clipboard = "unnamedplus"
opt.colorcolumn = "88,100"
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
opt.cursorline = true
opt.expandtab = true
opt.hidden = true
opt.ignorecase = true
opt.list = true
opt.listchars = { space = "·", tab = "›-" }
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.shortmess = "ifnIoOxTFltc"
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.scrolloff = 10
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.wrap = false
opt.laststatus = 3
opt.winbar = "%{&modified?'[+] ':''}%f"

-- Setup Lazy.nvim
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

local opts = { noremap = true, silent = true }

-- Escape terminal mode
api.nvim_set_keymap("t", "<C-o>", [[<C-\><C-n>]], opts)

-- Move Between and Close Splits
api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", opts)
api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", opts)
api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", opts)
api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", opts)
api.nvim_set_keymap("n", "<C-C>", ":close<CR>", opts)

-- Move Lines
api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", opts)
api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Clear search highlight on Esc
api.nvim_set_keymap("n", "<esc>", ":noh<CR>", opts)
