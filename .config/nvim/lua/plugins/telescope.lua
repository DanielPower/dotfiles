return {
	"nvim-telescope/telescope.nvim", -- Fuzzy find + UI
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Native fuzzy finder (improves performance)
	},
	lazy = true,
	keys = { "<leader>ff", "<leader>fg" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
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
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Telescope Resume" })
	end,
}
