local dap = require("dap")
local dap_python = require("dap-python")
local dap_vscode = require("dap.ext.vscode")
local dap_ui = require("dapui")
local keymap = require("astronauta.keymap")

local python_bin
if os.getenv("PYENV_VIRTUAL_ENV") then
	python_bin = os.getenv("PYENV_VIRTUAL_ENV") .. "/bin/python"
else
	python_bin = "/usr/bin/python"
end

dap_ui.setup()
dap_python.setup(python_bin)
dap_python.test_runner = "pytest"
dap_vscode.load_launchjs()

keymap.nnoremap({
	"<leader>b",
	function()
		dap.toggle_breakpoint()
	end,
})
keymap.nnoremap({
	"<leader>td",
	function()
		dap_python.test_method()
	end,
})
