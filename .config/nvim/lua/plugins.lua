local config = function(path)
	-- Can't return an inline function because of https://github.com/wbthomason/packer.nvim/issues/655
	-- Until then, every setup file needs to be wrapped ina  function
	return require("setup." .. path)
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Plugin Management
	use("editorconfig/editorconfig-vim") -- Editorconfig support
	use("tpope/vim-sleuth") -- Indentation auto-detection
	use("folke/tokyonight.nvim") -- Colorscheme
	use("easymotion/vim-easymotion") -- Quick navigation by characters
	use("tami5/lspsaga.nvim") -- LSP Utilities
	use({
		"iamcco/markdown-preview.nvim",
		run = "mkdp#util#install()",
	})
	use({
		"nvim-neorg/neorg",
		config = config("neorg"),
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"vim-test/vim-test", -- Unit Testing
		config = config("test"),
	})
	use({
		"folke/which-key.nvim", -- Keybind management and UI
		config = config("whichkey"),
	})
	use({
		"mhartington/formatter.nvim", -- Auto formatting
		config = config("formatter"),
	})
	use({
		"pwntester/octo.nvim", -- Github integration
		config = config("octo"),
	})
	use({
		"mfussenegger/nvim-dap", -- Debugging
		config = config("dap"),
		requires = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
		},
	})
	use({
		"L3MON4D3/LuaSnip", -- Snippets
		requires = {
			"rafamadriz/friendly-snippets",
			"mlaursen/vim-react-snippets",
		},
		config = config("luasnip"),
	})
	use({
		"terrortylor/nvim-comment", -- Comment lines and ranges
		config = config("comment"),
	})
	use({
		"hoob3rt/lualine.nvim", -- Statusbar
		config = config("lualine"),
	})
	use({
		"hrsh7th/nvim-cmp", -- Completion
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
		config = config("cmp"),
	})
	use({
		"williamboman/nvim-lsp-installer", -- Installer for language servers
		requires = "neovim/nvim-lspconfig",
		config = config("lsp_installer"),
	})
	use({
		"nvim-treesitter/nvim-treesitter", -- Used for highlighting and indentation
		run = ":TSUpdate",
		config = config("treesitter"),
	})
	use({
		"kyazdani42/nvim-tree.lua", -- File tree
		requires = { "kyazdani42/nvim-web-devicons" }, -- Pretty icons
		config = config("tree"),
	})
	use({
		"nvim-telescope/telescope.nvim", -- Fuzzy find + UI
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- Native fuzzy finder (improves performance)
		},
		config = config("telescope"),
	})
	use({
		"tpope/vim-fugitive", -- Git integration
		requires = "tpope/vim-rhubarb", -- Additional Github features for fugitive
	})
end)
