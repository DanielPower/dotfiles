vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
	options = {
		section_separators = { nil, nil },
		component_separators = { "|", "|" },
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(mode)
					return mode:sub(1, 1)
				end,
			},
		},
		lualine_b = {
			"branch",
			{ "diagnostics", sources = { "nvim_diagnostic" } },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "lsp_progress" },
		lualine_z = { "location" },
	},
})
