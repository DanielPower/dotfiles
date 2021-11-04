return function()
	local lsp_installer = require("nvim-lsp-installer")
	local configs = require("lsp")
	local on_attach = require("lsp.on_attach")

	lsp_installer.on_server_ready(function(server)
		local config = configs[server.name] or {}
		if not config.on_attach then
			config.on_attach = on_attach
		end
		server:setup(config)
	end)
end
