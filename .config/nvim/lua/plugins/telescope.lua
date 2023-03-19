return {
	"nvim-telescope/telescope.nvim", -- Fuzzy find + UI
	lazy = false,
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Native fuzzy finder (improves performance)
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local wk = require("which-key")

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

		wk.register({
			name = "Telescope",
			a = {
				function()
					builtin.builtin()
				end,
				"Show all pickers",
			},
			r = {
				function()
					builtin.resume()
				end,
				"Resume last picker",
			},
			f = {
				function()
					builtin.find_files({ hidden = true })
				end,
				"Find files",
			},
			g = {
				function()
					builtin.live_grep({ hidden = true })
				end,
				"Live grep",
			},
			d = {
				function()
					builtin.diagnostics({ hidden = true })
				end,
				"Diagnostics",
			},
			b = {
				function()
					builtin.buffers({ sort_mru = true })
				end,
				"Find buffers",
			},
		}, {
			prefix = "<leader>f",
		})
	end,
}
