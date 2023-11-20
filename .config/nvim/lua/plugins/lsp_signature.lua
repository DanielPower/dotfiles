return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	lazy = true,
	config = function()
		require("lsp_signature").setup({
			handler_opts = {
				border = "double",
			},
			hint_enable = false,
		})
	end,
}
