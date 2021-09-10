return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Plugin Management
	use("editorconfig/editorconfig-vim") -- Editorconfig support
	use("tpope/vim-sleuth") -- Indentation auto-detection
	use("neovim/nvim-lspconfig") -- LSP Configuration
	use("folke/tokyonight.nvim") -- Colorscheme
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
		"mhartington/formatter.nvim", -- Auto formatting
		config = function()
			require("setup.formatter")
		end,
	})
	use({
		"vimwiki/vimwiki", -- Personal wiki
		config = function()
			require("setup.vimwiki")
		end,
	})
	use({
		"pwntester/octo.nvim", -- Github integration
		config = function()
			require("octo").setup()
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
		"L3MON4D3/LuaSnip", -- Snippets
		requires = {
			"rafamadriz/friendly-snippets",
			"mlaursen/vim-react-snippets",
		},
		config = function()
			require("setup.luasnip")
		end,
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
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("setup.cmp")
		end,
	})
	use({
		"kabouzeid/nvim-lspinstall", -- Installer for language servers
		config = function()
			require("setup.lspinstall")
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
			"nvim-telescope/telescope-fzy-native.nvim", -- Native fuzzy finder (improves performance)
		},
		config = function()
			require("setup.telescope")
		end,
	})
	use({
		"tpope/vim-fugitive", -- Git integration
		requires = "tpope/vim-rhubarb", -- Additional Github features for fugitive
	})
	use({
		"folke/lsp-trouble.nvim", -- Linter/Diagnostic UI
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("setup.trouble")
		end,
	})
end)
