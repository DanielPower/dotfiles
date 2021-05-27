vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache" }
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_indent_markers = 1

vim.api.nvim_set_keymap('n', '<C-_>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
