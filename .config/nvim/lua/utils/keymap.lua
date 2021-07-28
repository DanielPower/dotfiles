return function(mode_list, key, callback, options)
	if type(mode_list) == "string" then
		mode_list = { mode_list }
	end

	if type(callback) == "function" then
		if not _G.keymap_callback_count then
			_G.keymap_callback_count = 0
		end
		local index = _G.keymap_callback_count
		_G.keymap_callback_count = _G.keymap_callback_count + 1
		_G["keymap_callback_" .. index] = callback
		callback = "v:lua.keymap_callback_" .. index .. "()"
	end

	for _, mode in ipairs(mode_list) do
		vim.api.nvim_set_keymap(mode, key, callback, options)
	end
end
