return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local on_attach = require("lsp.on_attach")
    for server, config in pairs({
      efm = require("lsp.efm"),
      eslint = require("lsp.eslint"),
      html = require("lsp.html"),
      lua_ls = require("lsp.lua_ls"),
      ts_ls = require("lsp.ts_ls"),
      yamlls = require("lsp.yamlls"),
      pyright = require("lsp.pyright"),
    }) do
      require("lspconfig")[server].setup(config)
    end
	end,
}
