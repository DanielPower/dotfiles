local trouble = require("trouble")
local wk = require("which-key")

trouble.setup()
wk.register({
	x = {
		function()
			trouble.toggle()
		end,
		"Show Diagnotics",
	},
}, {
	prefix = "<leader>",
})
