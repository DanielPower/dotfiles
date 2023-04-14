return {
	-- Commenting
	{
		"terrortylor/nvim-comment", -- Comment lines and ranges
		config = function()
			require("nvim_comment").setup({
				marker_padding = true,
				comment_empty = true,
				create_mappings = true,
				line_mapping = "gcc",
				operator_mapping = "gc",
			})
		end,
	},
	-- Automatic indentation
	{
		"Darazaki/indent-o-matic",
		lazy = false,
	},
}
