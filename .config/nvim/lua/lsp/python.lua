local util = require("lspconfig.util")

return {
	filetypes = { "python" },
	root_dir = util.root_pattern(".git"),
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
