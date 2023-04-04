local function keymap(mappings, opts, prefix)
  if #mappings > 0 then
    local cmd = ""
    local callback = nil
    if type(mappings[1]) == "string" then
      cmd = mappings[1]
    elseif type(mappings[1] == "function") then
      callback = mappings[1]
    else
      error("Keymap command must be a function or a string")
    end
    local lopts = {}
    for k, v in pairs(opts or {}) do
      lopts[k] = v
    end
    for k, v in pairs(mappings[3] or {}) do
      if type(k) ~= "number" then
        lopts[k] = v
      end
    end
    local modes = lopts.modes or { "n" }
    local desc = mappings[2]
    for _, mode in ipairs(modes) do
      if lopts.buffer then
        vim.api.nvim_buf_set_keymap(
          lopts.buffer,
          mode,
          prefix,
          cmd,
          { unpack(lopts), callback = callback, desc = desc }
        )
      else
        vim.api.nvim_set_keymap(mode, prefix, cmd, { unpack(lopts), callback = callback, desc = desc })
      end
    end
  else
    for key, value in pairs(mappings) do
      keymap(value, opts, (prefix or "") .. key)
    end
  end
end

return keymap
