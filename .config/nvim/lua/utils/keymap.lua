return function(mode, key, callback, options)
  local callback_string
  if type(callback) == "string" then
    callback_string = callback
  elseif type(callback) == "function" then
    if not _G.keymap_callback_count then
      _G.keymap_callback_count = 0
    end
    local index = _G.keymap_callback_count
    _G.keymap_callback_count = _G.keymap_callback_count + 1
    _G['keymap_callback_'..index] = callback
    callback_string = 'v:lua.keymap_callback_'..index..'()'
  end
  vim.api.nvim_set_keymap(mode, key, callback_string, options)
end
