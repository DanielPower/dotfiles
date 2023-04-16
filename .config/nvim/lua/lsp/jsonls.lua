local on_attach = require("lsp.on_attach")

return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client, bufnr)
  end,
}
