local compe = require('compe')
local luasnip = require('luasnip')
local keymap = require('utils.keymap')

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

local termcode = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function TabComplete()
  if vim.fn.pumvisible() == 1 then
    return termcode "<C-n>"
  elseif luasnip.expand_or_jumpable() then
    luasnip.jump(1)
    return ""
  end
  return termcode "<Tab>"
end

function ShiftTabComplete()
  if vim.fn.pumvisible() == 1 then
    return termcode "<C-p>"
  elseif luasnip.expand_or_jumpable() then
    luasnip.jump(-1)
    return ""
  end
  return termcode "<S-Tab>"
end

keymap({"i", "s", "n"}, "<Tab>", TabComplete, {expr = true})
keymap({"i", "s", "n"}, "<S-Tab>", ShiftTabComplete, {expr = true})
keymap("i", "<C-Space>", "compe#complete()", {expr = true})
keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true})
keymap("i", "<C-e>", "compe#close('<C-e>')", {expr = true})
