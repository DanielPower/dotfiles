local on_attach = require("lsp.on_attach")

return {
	ensure_installed = true,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
		on_attach(client, bufnr)
	end,
}
