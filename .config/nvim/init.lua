-- Options
vim.g.mapleader = " "
vim.g.python3_host_prog = "/home/daniel/.pyenv/versions/neovim/bin/python3"
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "88,100"
vim.opt.completeopt = {}
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = { space = "·", tab = "›-" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shortmess = "ifnIoOxTFltc"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.scrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.winbar = "%{&modified?'[+] ':''}%f"
vim.opt.mousemodel = "extend"

-- Escape terminal mode
vim.keymap.set("t", "<C-o>", [[<C-\><C-n>]])

-- Move Between and Close Splits
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<C-C>", ":close<CR>")

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

-- Clear search highlight on Esc
vim.keymap.set("n", "<esc>", ":noh<CR>")

if not vim.g.vscode then
	-- Setup Lazy.nvim
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.uv.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
	require("lazy").setup("plugins")

	vim.cmd("colorscheme tokyonight")

	vim.diagnostic.config({
		virtual_text = true,
		underline = true,
		update_in_insert = false,
		severity_sort = false,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "󰌵",
			},
		},
	})
end
