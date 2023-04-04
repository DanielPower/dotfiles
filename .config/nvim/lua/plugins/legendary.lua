return {
	"mrjones2014/legendary.nvim",
	lazy = true,
	keys = {
		{
			"<c-p>",
			function()
				require("legendary").find({ filters = { require("legendary.filters").current_mode() } })
			end,
			mode = { "n", "i" },
		},
	},
	config = function()
		require("legendary").setup({
			include_builtin = true,
			include_legendary_cmds = false,
		})
	end,
}
