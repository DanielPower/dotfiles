local wk = require("which-key")
local tsBuiltin = require("telescope.builtin")

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "double",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "double",
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})

return function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	wk.register({
		["<leader>K"] = { vim.lsp.buf.signature_help, "Show signature help" },
		["<leader>ca"] = { vim.lsp.buf.code_action, "Code actions" },
		["<leader>cd"] = { vim.diagnostic.open_float, "Show line diagnostics" },
		["<leader>rr"] = { vim.lsp.buf.rename, "Rename symbol" },
		["K"] = { vim.lsp.buf.hover, "Show definition" },
		["gD"] = { vim.lsp.buf.declaration, "Go to declaration" },
		["gd"] = { vim.lsp.buf.definition, "Go to definition" },
		["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
		["gr"] = { tsBuiltin.lsp_references, "Find references" },
	}, {
		buffer = bufnr,
	})
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.formatting_sync()
			end,
			buffer = bufnr,
		})
	end
end
