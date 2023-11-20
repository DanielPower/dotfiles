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
	Keymap({
		["<leader>"] = {
			["K"] = { vim.lsp.buf.signature_help, "Show signature help" },
			["ca"] = { vim.lsp.buf.code_action, "Code actions" },
			["cd"] = { vim.diagnostic.open_float, "Show line diagnostics" },
			["ck"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
			["cj"] = { vim.diagnostic.goto_next, "Next diagnostic" },
			["rr"] = { vim.lsp.buf.rename, "Rename symbol" },
		},
		["K"] = { vim.lsp.buf.hover, "Show definition" },
		["gD"] = { vim.lsp.buf.declaration, "Go to declaration" },
		["gd"] = { vim.lsp.buf.definition, "Go to definition" },
		["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
		["gt"] = { vim.lsp.buf.type_definition, "Go to type definition" },
		["gr"] = { require("telescope.builtin").lsp_references, "Find references" },
	}, {
		buffer = bufnr,
	}).bind()
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format()
			end,
			buffer = bufnr,
		})
	end
end
