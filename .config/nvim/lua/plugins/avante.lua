return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		provider = "copilot",
		copilot = {
			model = "claude-3.7-sonnet",
		},
	},
}
