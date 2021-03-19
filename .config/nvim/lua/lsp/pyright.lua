lspconfig = require('lspconfig')

require('lspconfig').pyright.setup({
  root_dir = lspconfig.util.root_pattern('.git'),
})
