-- Options
vim.g.mapleader = " "
vim.opt.autoread = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = { 88, 100 }
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cursorline = true
vim.opt.diffopt:append({ "linematch:60" })
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { space = "·", tab = "›-" }
vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.shortmess = "ifnIoOxTFltc"
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.winbar = "%{&modified?'[+] ':''}%f"
vim.opt.wrap = false

vim.keymap.set("t", "<C-o>", [[<C-\><C-n>]], { desc = "Escape terminal mode" })
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Move to right split" })
vim.keymap.set("n", "<C-C>", ":close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<esc>", ":noh<CR>", { desc = "Clear search highlight", silent = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
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
