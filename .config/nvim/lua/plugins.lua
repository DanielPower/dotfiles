
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'editorconfig/editorconfig-vim' -- Editorconfig support
  use 'tpope/vim-sleuth'
  use 'neovim/nvim-lspconfig'
  use 'folke/tokyonight.nvim'
  use {
    'terrortylor/nvim-comment',
    config = function() require('setup.nvim_comment') end,
  }
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('setup.lualine') end,
  }
  use {
    'hrsh7th/nvim-compe',
    config = function() require('setup.nvim_compe') end,
  }
  use {
    'kabouzeid/nvim-lspinstall',
    config = function() require('setup.nvim_lspinstall') end,
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('setup.treesitter') end,
  }
  use {
    'sindrets/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require('setup.nvim_tree') end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = function() require('setup.telescope') end,
  }
  use {
    'tpope/vim-fugitive',
    requires = 'tpope/vim-rhubarb'
  }
  use {
    'folke/lsp-trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('trouble').setup() end,
  }
end)
