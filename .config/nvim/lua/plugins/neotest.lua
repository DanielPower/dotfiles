local keymap = Keymap({
  ["<leader>t"] = {
    n = {
      function(neotest)
        neotest.run.run()
      end,
      "Test nearest",
    },
    f = {
      function(neotest)
        neotest.run.run(vim.fn.expand("%"))
      end,
      "Test file",
    },
    o = {
      function(neotest)
        neotest.output.open()
      end,
      "Test output",
    },
    p = {
      function(neotest)
        neotest.output_panel.open()
      end,
      "Test output panel",
    },
    s = {
      function(neotest)
        neotest.summary.open()
      end,
      "Test summary",
    },
    w = {
      n = {
        function(neotest)
          neotest.watch.watch()
        end,
        "Watch nearest",
      },
      f = {
        function(neotest)
          neotest.watch.watch(vim.fn.expand("%"))
        end,
        "Watch file",
      },
    },
  },
})

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest",
    "nvim-neotest/neotest-python",
  },
  lazy = true,
  keys = keymap.keys,
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-jest"),
        require("neotest-python"),
      },
      virtual_text = true,
      status = {
        virtual_text = true,
      },
      output = {
        open_on_run = false,
      },
    })
    keymap.bind(neotest)
  end,
}
