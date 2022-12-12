require("lualine").setup({
	options = {
		theme = "tokyonight",
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
		lualine_y = {},
		lualine_z = { "location" },
	},
})
