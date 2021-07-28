local keymap = require("astronauta.keymap")

keymap.nnoremap({ "<leader>tn", ":TestNearest<CR>" })
keymap.nnoremap({ "<leader>tf", ":TestFile<CR>" })
keymap.nnoremap({ "<leader>ts", ":TestSuite<CR>" })
keymap.nnoremap({ "<leader>tl", ":TestLast<CR>" })
keymap.nnoremap({ "<leader>tg", ":TestVisit<CR>" })
