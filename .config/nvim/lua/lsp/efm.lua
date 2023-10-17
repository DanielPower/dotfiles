local prettier = {
  formatCommand = vim.fn.stdpath("data") .. "/mason/bin/prettierd ${INPUT}",
  formatStdin = true,
}

local black = {
  formatCommand = "black --quiet -",
  formatStdin = true,
}

local isort = {
  formatCommand = "isort --quiet -",
  formatStdin = true,
}

local stylua = {
  formatCommand = "stylua -",
  formatStdin = true,
}

local ruff = {
  lintCommand = "ruff check -",
  lint = true,
}

local languages = {
  javascript = { prettier },
  javascriptreact = { prettier },
  typescript = { prettier },
  typescriptreact = { prettier },
  python = { ruff, isort, black },
  yaml = { prettier },
  lua = { stylua },
  scss = { prettier },
  css = { prettier },
  json = { prettier },
  jsonc = { prettier },
  graphql = { prettier },
  markdown = { prettier },
  html = { prettier },
}

local filetype_set = {}
for key, _ in pairs(languages) do
  filetype_set[key] = true
end

local filetypes = {}
for key, _ in pairs(filetype_set) do
  table.insert(filetypes, key)
end

return {
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/efm-langserver",
    "-logfile",
    vim.fn.stdpath("data") .. "/efm.log",
  },
  root_dir = require("lspconfig").util.root_pattern({ "." }),
  init_options = { documentFormatting = true },
  settings = {
    languages = languages,
  },
  filetypes = filetypes,
}
