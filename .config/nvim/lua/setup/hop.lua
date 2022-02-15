local hop = require("hop")
local hopHint = require("hop.hint")
hop.setup()

vim.api.nvim_set_keymap("n", "f", "", {
	callback = function()
		hop.hint_char1({
			direction = hopHint.HintDirection.AFTER_CURSOR,
			current_line_only = true,
		})
	end,
})
vim.api.nvim_set_keymap("n", "F", "", {
	callback = function()
		hop.hint_char1({
			direction = hopHint.HintDirection.BEFORE_CURSOR,
			current_line_only = true,
		})
	end,
})
vim.api.nvim_set_keymap("o", "f", "", {
	callback = function()
		hop.hint_char1({
			direction = hopHint.HintDirection.AFTER_CURSOR,
			current_line_only = true,
		})
	end,
})
vim.api.nvim_set_keymap("o", "F", "", {
	callback = function()
		hop.hint_char1({
			direction = hopHint.HintDirection.BEFORE_CURSOR,
			current_line_only = true,
		})
	end,
})
vim.api.nvim_set_keymap("t", "f", "", {
	callback = function()
		hop.hint_char1({
			direction = hopHint.HintDirection.AFTER_CURSOR,
			current_line_only = true,
		})
	end,
})
vim.api.nvim_set_keymap("t", "F", "", {
	callback = function()
		hop.hint_char1({
			direction = hopHint.HintDirection.BEFORE_CURSOR,
			current_line_only = true,
		})
	end,
})
