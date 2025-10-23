return function(client, bufnr)
	vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
	Keymap({
		["K"] = {
			function()
				print("K pressed")
				vim.lsp.buf.hover({ border = "single" })
			end,
			"Show definition",
		},
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
