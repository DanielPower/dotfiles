return {
	"nvim-treesitter/nvim-treesitter", -- Used for highlighting and indentation
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
