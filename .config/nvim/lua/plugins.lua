local config = function(path)
	return function()
		require("setup." .. path)
	end
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Plugin Management
	use("editorconfig/editorconfig-vim") -- Editorconfig support
	use("tpope/vim-sleuth") -- Indentation auto-detection
	use("neovim/nvim-lspconfig") -- LSP Configuration
	use("folke/tokyonight.nvim") -- Colorscheme
	use("easymotion/vim-easymotion") -- Quick navigation by characters
	use({
		"tami5/lspsaga.nvim",
		commit = "276822b611b26be2e52a31d8eef1ccce30b819a5",
	}) -- LSP Utilities
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
		"vimwiki/vimwiki", -- Personal wiki
		config = config("vimwiki"),
	})
	use({
		"pwntester/octo.nvim", -- Github integration
		config = function()
			require("octo").setup()
		end,
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
		"kabouzeid/nvim-lspinstall", -- Installer for language servers
		config = config("lspinstall"),
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
	use({
		"folke/lsp-trouble.nvim", -- Linter/Diagnostic UI
		requires = { "kyazdani42/nvim-web-devicons" },
		config = config("trouble"),
	})
end)
