local on_attach = require('lsp.on_attach')

require('lspconfig').svelte.setup({
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(clinet, bufnr)
  end
})
