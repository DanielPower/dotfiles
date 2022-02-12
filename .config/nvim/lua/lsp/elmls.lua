local on_attach = require("lsp.on_attach")

return {
	on_attach = function(client, bufnr)
		vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
		on_attach(client, bufnr)
	end,
}
