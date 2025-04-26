return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = "VeryLazy",
	config = function()
		local on_attach = require("lsp.on_attach")
		local base_config = {
			on_attach = on_attach,
		}

		for server, config in pairs({
			efm = require("lsp.efm"),
			eslint = require("lsp.eslint"),
			html = require("lsp.html"),
			lua_ls = require("lsp.lua_ls"),
			ts_ls = require("lsp.ts_ls"),
			yamlls = require("lsp.yamlls"),
			pyright = require("lsp.pyright"),
			terraformls = require("lsp.terraformls"),
			svelte = require("lsp.svelte"),
			tailwindcss = require("lsp.tailwindcss"),
			ols = require("lsp.ols"),
		}) do
			local merged_config = vim.tbl_extend("force", base_config, config)
			require("lspconfig")[server].setup(merged_config)
		end
	end,
}
