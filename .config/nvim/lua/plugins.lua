return require('packer').startup(function()
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'editorconfig/editorconfig-vim' -- Editorconfig support
  use 'glepnir/lspsaga.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'hrsh7th/nvim-compe'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive' -- Git Integration
end)
