local keymap = Keymap({
	["<leader>f"] = {
		a = {
			function(builtin)
				builtin.builtin()
			end,
			"Show all pickers",
		},
		r = {
			function(builtin)
				builtin.resume()
			end,
			"Resume last picker",
		},
		f = {
			function(builtin)
				builtin.find_files({ hidden = true })
			end,
			"Find files",
		},
		g = {
			function(builtin)
				builtin.live_grep({ hidden = true })
			end,
			"Live grep",
		},
		d = {
			function(builtin)
				builtin.diagnostics({ hidden = true })
			end,
			"Diagnostics",
		},
		b = {
			function(builtin)
				builtin.buffers({ sort_mru = true })
			end,
			"Find buffers",
		},
	},
})

return {
	"nvim-telescope/telescope.nvim", -- Fuzzy find + UI
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Native fuzzy finder (improves performance)
	},
	keys = keymap.lazyKeys,
	config = function()
		local telescope = require("telescope")
		keymap.bind(require("telescope.builtin"))
		telescope.setup({
			defaults = {
				prompt_prefix = "> ",
				selection_caret = "> ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				scroll_strategy = "cycle",
				layout_strategy = "vertical",
				layout_config = {
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = true,
					},
				},
				preview = {
					check_mime_type = true,
					filesize_limit = 1,
					timeout = 100,
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
