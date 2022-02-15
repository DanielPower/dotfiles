return function()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = { enable = true },
		indent = { enable = true },
	})
end
