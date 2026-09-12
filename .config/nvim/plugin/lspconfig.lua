vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable("tsc")
vim.lsp.enable("efm")
vim.lsp.enable("html")
vim.lsp.enable("lua_ls")

local function feedkey(key)
  return vim.api.nvim_replace_termcodes(key, true, true, true)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })

      -- Trigger autocompletion menu on input as long as there's a match
      vim.api.nvim_create_autocmd("TextChangedI", {
        buffer = event.buf,
        callback = function()
          if vim.fn.pumvisible() == 1 then
            return
          end
          local line_to_cursor = vim.api.nvim_get_current_line():sub(1, vim.fn.col(".") - 1)
          if vim.fn.match(line_to_cursor, [[\k$]]) >= 0 then
            vim.lsp.completion.get()
          end
        end,
      })

      vim.keymap.set("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end, { buffer = event.buf, silent = true, desc = "Trigger completion" })

      vim.keymap.set("i", "<Tab>", function()
        if vim.fn.pumvisible() == 1 then
          return feedkey("<C-n>")
        end
        return feedkey("<Tab>")
      end, { buffer = event.buf, expr = true, silent = true })

      vim.keymap.set("i", "<S-Tab>", function()
        if vim.fn.pumvisible() == 1 then
          return feedkey("<C-p>")
        end
        return feedkey("<S-Tab>")
      end, { buffer = event.buf, expr = true, silent = true })

      vim.keymap.set("i", "<CR>", function()
        if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "selected" }).selected ~= -1 then
          return feedkey("<C-y>")
        end
        return feedkey("<CR>")
      end, { buffer = event.buf, expr = true, silent = true })
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
