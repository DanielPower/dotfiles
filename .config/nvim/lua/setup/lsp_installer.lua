local lsp_installer = require("nvim-lsp-installer")
local path = require("nvim-lsp-installer.path")
local lspconfig = require("lspconfig")
local lsp_servers = require("lsp")
local on_attach = require("lsp.on_attach")

local lsp_server_keys = {}
for key, config in pairs(lsp_servers) do
	if config.ensure_installed then
		table.insert(lsp_server_keys, key)
	end
end

lsp_installer.setup({
	ensure_installed = lsp_server_keys,
	automatic_installtion = true,
	install_root_dir = path.concat({ vim.fn.stdpath("data"), "lsp_servers" }),
	log_level = vim.log.levels.INFO,
})

for key, config in pairs(lsp_servers) do
	if not config.on_attach then
		config.on_attach = on_attach
	end
	lspconfig[key].setup(config)
end
