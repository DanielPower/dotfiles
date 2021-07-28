local dap = require('dap')
local keymap = require('astronauta.keymap')

require('dap.ext.vscode').load_launchjs()
keymap.nnoremap({ '<leader>b', function() dap.toggle_breakpoint() end })

dap.adapters.python = {
  type = 'executable',
  command = os.getenv('PYENV_VIRTUAL_ENV')..'/bin/python',
  args = { '-m', 'debugpy.adapter' },
}
