local dap = require('dap')
local python = require('dap-python')
local keymap = require('astronauta.keymap')

keymap.nnoremap({ '<leader>b', function() dap.toggle_breakpoint() end })

python.setup()
