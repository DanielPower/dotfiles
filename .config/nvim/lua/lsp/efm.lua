local on_attach = require('lsp.on_attach')

local eslint = {
  lintCommand = "npx eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
}

local prettier = {
  formatCommand = "prettier --find-config-path --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local flake8 = {
  lintCommand = "flake8 --stdin-display-name ${INPUT} =",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
}

local black = {
  formatCommand = "black --quiet -",
  formatStdin = true,
}

require("lspconfig").efm.setup({
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { "package.json", ".git/" },
    languages = {
      javascript = { eslint, prettier },
      javascriptreact = { eslint, prettier },
      typescript = { eslint, prettier },
      typescriptreact = { eslint, prettier },
      python = { flake8, black },
    }
  },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "python" }
})
