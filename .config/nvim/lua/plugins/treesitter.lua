return {
	"nvim-treesitter/nvim-treesitter", -- Used for highlighting and indentation
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
		})
	end,
}
