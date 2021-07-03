local compe = require('compe')
local luasnip = require('luasnip')

compe.setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 3,
    preselect = 'disable',
    throttle_time = 80;
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
      path = true,
      buffer = true,
      calc = true,
      nvim_lsp = true,
      nvim_lua = true,
      luasnip = true,
    };
})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function TabComplete()
  if vim.fn.pumvisible() == 1 then
    return t("<C-n>")
  elseif luasnip.expand_or_jumpable() then
    luasnip.jump(1)
    return ""
  end
  return t("<Tab>")
end

function ShiftTabComplete()
  if vim.fn.pumvisible() == 1 then
    return t("<C-p>")
  elseif luasnip.expand_or_jumpable() then
    luasnip.jump(-1)
    return ""
  end
  return t("<S-Tab>")
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.TabComplete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.TabComplete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.ShiftTabComplete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.ShiftTabComplete()", {expr = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true})
