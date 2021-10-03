local treesitter = require("nvim-treesitter.configs")
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}

treesitter.setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = { enable = true },
	indent = { enable = true },
})
