local treesitter = require("nvim-treesitter.configs")

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

treesitter.setup({
	ensure_installed = "all",
	highlight = { enable = true },
})
