return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  lazy = true,
  config = function()
    require("lsp_signature").setup({
      max_width = 120,
      handler_opts = {
        border = "single",
      },
      doc_lines = 0,
      hint_enable = false,
      zindex = 50,
    })
  end,
}
