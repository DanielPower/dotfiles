local lspInstall = require('lspinstall')
local lspConfig = require('lspconfig')
local configs = require('lsp')

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
}

local installed_servers = require'lspinstall'.installed_servers()
for _, server in pairs(required_servers) do
  if not vim.tbl_contains(installed_servers, server) then
    require'lspinstall'.install_server(server)
  end
end

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
require('lspinstall').post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
