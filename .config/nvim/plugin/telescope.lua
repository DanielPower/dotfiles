vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if
			name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update")
		then
			vim.system({ "make" }, { cwd = ev.data.path })
		end
	end,
})

vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	{
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		name = "telescope-fzf-native.nvim",
	},
})

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
