vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable("tsc")
vim.lsp.enable("efm")
vim.lsp.enable("html")
vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = event.buf })
        end,
      })
    end

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({ border = "single" })
    end, { buffer = event.buf })
  end
})
