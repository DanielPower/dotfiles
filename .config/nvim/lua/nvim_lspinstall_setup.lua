local lspInstall = require('lspinstall')
local lspConfig = require('lspconfig')
local efmConfig = require('lsp.efm')
local svelteConfig = require('lsp.svelte')
local tsserverConfig = require('lsp.tsserver')

local configs = {
  efm = efmConfig,
  svelte = svelteConfig,
  tsserver = tsserverConfig,
}

local function setup_servers()
  lspInstall.setup()
  local servers = lspInstall.installed_servers()
  for _, server in pairs(servers) do
    local config = configs[server] or {}
    lspConfig[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
