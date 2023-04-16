return {
	"nvim-treesitter/nvim-treesitter", -- Used for highlighting and indentation
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all",
			highlight = { enable = true },
			indent = { enable = true },
			context_commentstring = { enable = true },
		})
	end,
}
