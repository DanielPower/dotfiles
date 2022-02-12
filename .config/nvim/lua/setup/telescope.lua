local telescope = require("telescope")
local builtin = require("telescope.builtin")
local wk = require("which-key")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},
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
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		preview = {
			check_mime_type = true,
			filesize_limit = 1,
			timeout = 100,
		},
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
})

telescope.load_extension("fzf")

vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>Telescope<cr>", {})

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
	d = {
		function()
			builtin.diagnostics({ hidden = true })
		end,
		"Diagnostics",
	},
	b = {
		function()
			builtin.buffers()
		end,
		"Find buffers",
	},
}, {
	prefix = "<leader>f",
})
