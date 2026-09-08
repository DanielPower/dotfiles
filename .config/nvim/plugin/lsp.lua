vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client then
			if client:supports_method("textDocument/formatting") then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = event.buf,
					callback = function()
						vim.lsp.buf.format({ bufnr = event.buf })
					end,
				})
			end
			vim.lsp.completion.enable(true, client.id, event.buf, {
				autotrigger = true,
			})
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({ border = "single" })
			end, { buffer = event.buf })
		end
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("efm")
