vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.capabilities.textDocument.formatting then
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, { buf = 0 })
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("efm")
