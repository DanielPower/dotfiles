local function parseMapTree(mapTree, opts, prefix)
	if #mapTree > 0 then
		local mapping = {}
		mapping.cmd = mapTree[1]
		mapping.desc = mapTree[2]
		mapping.opts = {}
		mapping.sequence = prefix
		for k, v in pairs(opts or {}) do
			mapping.opts[k] = v
		end
		for k, v in pairs(mapTree[3] or {}) do
			if type(k) ~= "number" then
				mapping.opts[k] = v
			end
		end
		return { mapping }
	else
		local mappings = {}
		for key, mapping in pairs(mapTree) do
			local subMappings = parseMapTree(mapping, opts, prefix .. key)
			for _, subMapping in ipairs(subMappings) do
				table.insert(mappings, subMapping)
			end
		end
		return mappings
	end
end

local function bind(mapping, context)
	for _, mode in ipairs(mapping.mode or { "n" }) do
		local lopts = {}
		local cmd = ""
		if type(mapping.cmd) == "string" then
			cmd = mapping.cmd
		end
		if type(mapping.cmd) == "function" then
			lopts.callback = function()
				mapping.cmd(context)
			end
		end
		if lopts.buffer then
			vim.api.nvim_buf_set_keymap(lopts.buffer, mode, mapping.sequence, cmd, lopts)
		else
			vim.api.nvim_set_keymap(mode, mapping.sequence, cmd, lopts)
		end
	end
end

local function keymap(mapTree, opts)
	local mappings = parseMapTree(mapTree, opts, "")
	local lazyKeys = {}
	for _, mapping in ipairs(mappings) do
		table.insert(lazyKeys, { mapping.sequence })
	end
	return {
		bind = function(context)
			for _, mapping in ipairs(mappings) do
				bind(mapping, context)
			end
		end,
		keys = lazyKeys,
	}
end

return keymap
