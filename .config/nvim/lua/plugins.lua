return require('packer').startup(function()
  use 'editorconfig/editorconfig-vim' -- Editorconfig support
  use 'glepnir/lspsaga.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'tpope/vim-sleuth'
  use 'hrsh7th/nvim-compe'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use 'neovim/nvim-lspconfig'
  use 'wbthomason/packer.nvim'
  use { 
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 
    'tpope/vim-fugitive',
    requires = { 'tpope/vim-rhubarb' }
  }
  use 'terrortylor/nvim-comment'
  use 'folke/tokyonight.nvim'
  use 'kabouzeid/nvim-lspinstall'
  use {
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  }
end)
