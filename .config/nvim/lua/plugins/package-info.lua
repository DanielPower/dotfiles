return {
  "vuki656/package-info.nvim",
  lazy = true,
  event = { "BufEnter package.json" },
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    local pi = require("package-info")
    pi.setup({
      hide_up_to_date = true,
      hide_unstable_versions = true,
      autostart = true,
    })
    Keymap({
      ["<leader>p"] = {
        i = {
          function()
            pi.install()
          end,
          "Install package",
        },
        c = {
          function()
            pi.change_version()
          end,
          "Change package version",
        },
        d = {
          function()
            pi.delete()
          end,
          "Delete package",
        },
        u = {
          function()
            pi.update()
          end,
          "Update package",
        },
        r = {
          function()
            pi.show({ force = true })
          end,
          "Refresh packages",
        },
      },
    })
  end,
}
