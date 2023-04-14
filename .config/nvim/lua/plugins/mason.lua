return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	lazy = false,
	config = function()
		local on_attach = require("lsp.on_attach")
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local config = require("lsp")[server_name] or {}
				if not config.on_attach then
					config.on_attach = on_attach
				end
				require("lspconfig")[server_name].setup(config)
			end,
		})
	end,
}
