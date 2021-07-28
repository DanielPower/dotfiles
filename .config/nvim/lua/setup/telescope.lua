local telescope = require("telescope")

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
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
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
		path_display = function(opts, path)
			local segments = {}
			for segment in string.gmatch(path, "([^/]+)") do
				table.insert(segments, segment)
			end
			return segments[#segments] .. " " .. path
		end,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
})

telescope.load_extension("fzy_native")

vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>Telescope<cr>", {})
