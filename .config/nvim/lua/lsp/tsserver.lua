local on_attach = require('lsp.on_attach')

return {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  settings = {
    rootMarkers = { "package.json" },
  },
}
