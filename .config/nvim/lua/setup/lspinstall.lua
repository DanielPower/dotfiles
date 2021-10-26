return function()
	local lsp_install = require("lspinstall")
	local lsp_config = require("lspconfig")
	local configs = require("lsp")
	local on_attach = require("lsp.on_attach")

	-- Install missing language servers
	local required_servers = {
		"bash",
		"css",
		"graphql",
		"html",
		"json",
		"lua",
		"python",
		"rust",
		"svelte",
		"typescript",
		"vim",
		"yaml",
		"efm",
		"go",
	}

	local installed_servers = require("lspinstall").installed_servers()
	for _, server in pairs(required_servers) do
		if not vim.tbl_contains(installed_servers, server) then
			require("lspinstall").install_server(server)
		end
	end

	local function setup_servers()
		lsp_install.setup()
		local servers = lsp_install.installed_servers()
		for _, server in pairs(servers) do
			local config = configs[server] or {}
			-- Use default on_attach if none specified in language server config
			if not config.on_attach then
				config.on_attach = on_attach
			end
			lsp_config[server].setup(config)
		end
	end

	setup_servers()

	-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
	require("lspinstall").post_install_hook = function()
		setup_servers() -- reload installed servers
		vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
	end

	-- Provide a user function to reinstall all servers
	function lsp_reinstall_servers()
		for _, server in pairs(required_servers) do
			require("lspinstall").install_server(server)
		end
	end

	vim.cmd("command! LspReinstallAll :lua lsp_reinstall_servers()")
end
