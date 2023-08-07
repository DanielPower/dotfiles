return {
  "simrat39/rust-tools.nvim",
  config = function()
    require("rust-tools").setup({
      server = {
        on_attach = require("lsp.on_attach"),
      },
    })
  end,
}
