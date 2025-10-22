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
			ruff = {},
		}) do
			local merged_config = vim.tbl_extend("force", base_config, config)
			vim.lsp.config(server, merged_config)
			vim.lsp.enable(server)
		end
	end,
}
