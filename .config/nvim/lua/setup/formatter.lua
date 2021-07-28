local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local luafmt = function()
  return {
    exe = "luafmt",
    args = {"--indent-count", 2, "--stdin"},
    stdin = true
  }
end

local black = function()
  return {
    exe = "black",
    args = {"--quiet", "-"},
    stdin = true,
  }
end

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = { prettier },
    javascriptreact = { prettier },
    typescript = { prettier },
    typescriptreact = { prettier },
    json = { prettier },
    lua = { luafmt },
    python = { black },
  }
})

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.lua,*.json,*.py FormatWrite
augroup END
]], true)
