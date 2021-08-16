local dap_python = require("dap-python")
local wk = require("which-key")

vim.g["test#strategy"] = "neovim"
wk.register({
	name = "Test",
	n = {
		":TestNearest<CR>",
		"Run Nearest",
	},
	f = {
		":TestFile<CR>",
		"Run File",
	},
	s = {
		":TestSuite<CR>",
		"Run Suite",
	},
	l = {
		":TestLast<CR>",
		"Run Last",
	},
	g = {
		":TestVisit<CR>",
		"Visit",
	},
	d = {
		function()
			dap_python.test_method()
		end,
		"Debug Nearest",
	},
}, {
	prefix = "<leader>t",
})
