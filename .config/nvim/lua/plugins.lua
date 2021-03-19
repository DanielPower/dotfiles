return require('packer').startup(function()
  use { 'wbthomason/packer.nvim', opt = true }
  use 'editorconfig/editorconfig-vim' -- Editorconfig support
  use 'evanleck/vim-svelte'
  use 'hoob3rt/lualine.nvim'
  use 'joshdick/onedark.vim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'romgrk/barbar.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive' -- Git Integration
  use 'tpope/vim-sleuth' -- Detect Indentation
  use 'tpope/vim-surround'
end)
