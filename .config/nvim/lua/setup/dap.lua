local wk = require("which-key")
local dap = require("dap")
local dap_python = require("dap-python")
local dap_vscode = require("dap.ext.vscode")
local dap_ui = require("dapui")

local python_bin
if os.getenv("PYENV_VIRTUAL_ENV") then
	python_bin = os.getenv("PYENV_VIRTUAL_ENV") .. "/bin/python"
else
	python_bin = "/usr/bin/python"
end

dap_ui.setup({})
dap_python.setup(python_bin)
dap_python.test_runner = "pytest"
dap_vscode.load_launchjs()

wk.register({
	name = "Debug",
	u = {
		function()
			dap_ui.toggle()
		end,
		"Toggle UI",
	},
	c = {
		function()
			dap.continue()
		end,
		"Continue",
	},
	b = {
		function()
			dap.toggle_breakpoint()
		end,
		"Toggle Breakpoint",
	},
	q = {
		function()
			dap.close()
		end,
		"Close Debugger",
	},
}, {
	prefix = "<leader>d",
})

wk.register({
	name = "Step",
	o = {
		function()
			dap.step_over()
		end,
		"Step Over",
	},
	i = {
		function()
			dap.step_into()
		end,
		"Step Into",
	},
	u = {
		function()
			dap.step_out()
		end,
		"Step Out",
	},
}, {
	prefix = "<leader>ds",
})
