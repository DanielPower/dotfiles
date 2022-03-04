return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Plugin Management
	use("editorconfig/editorconfig-vim") -- Editorconfig support
	use("Darazaki/indent-o-matic") -- Indentation auto-detection
	use("folke/tokyonight.nvim") -- Colorscheme
	use("tpope/vim-fugitive") -- Git integration
	use({
		"phaazon/hop.nvim",
		config = function()
			require("setup.hop")
		end,
	}) -- Quick navigation by characters
	use({
		"iamcco/markdown-preview.nvim",
		run = "mkdp#util#install()",
	})
	use({
		"vim-test/vim-test", -- Unit Testing
		config = function()
			require("setup.test")
		end,
	})
	use({
		"folke/which-key.nvim", -- Keybind management and UI
		config = function()
			require("setup.whichkey")
		end,
	})
	use({
		"mfussenegger/nvim-dap", -- Debugging
		config = function()
			require("setup.dap")
		end,
		requires = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
		},
	})
	use({
		"terrortylor/nvim-comment", -- Comment lines and ranges
		config = function()
			require("setup.comment")
		end,
	})
	use({
		"hoob3rt/lualine.nvim", -- Statusbar
		config = function()
			require("setup.lualine")
		end,
	})
	use({
		"hrsh7th/nvim-cmp", -- Completion
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("setup.cmp")
		end,
	})
	use({
		"williamboman/nvim-lsp-installer", -- Installer for language servers
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("setup.lsp_installer")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter", -- Used for highlighting and indentation
		run = ":TSUpdate",
		config = function()
			require("setup.treesitter")
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua", -- File tree
		requires = { "kyazdani42/nvim-web-devicons" }, -- Pretty icons
		config = function()
			require("setup.tree")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim", -- Fuzzy find + UI
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- Native fuzzy finder (improves performance)
		},
		config = function()
			require("setup.telescope")
		end,
	})
end)
