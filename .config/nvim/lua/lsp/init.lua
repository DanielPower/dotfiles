local util = require("lspconfig/util")

return {
	efm = require("lsp.efm"),
	svelte = require("lsp.svelte"),
	tsserver = require("lsp.tsserver"),
	sumneko_lua = require("lsp.sumneko_lua"),
	pyright = require("lsp.pyright"),
}
