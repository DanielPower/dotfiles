local keymap = Keymap({
	["<leader>t"] = {
		n = {
			function(neotest)
				neotest.run.run()
			end,
			"Test nearest",
		},
	},
})

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"haydenmeade/neotest-jest",
	},
	lazy = true,
	keys = keymap.keys,
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-jest"),
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
