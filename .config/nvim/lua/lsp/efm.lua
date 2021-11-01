local on_attach = require("lsp.on_attach")

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
}

local flake8 = {
	lintCommand = "flake8 --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
}

local languages = {
	javascript = { eslint },
	javascriptreact = { eslint },
	typescript = { eslint },
	typescriptreact = { eslint },
	svelte = { eslint },
	python = { flake8 },
}

local filetype_set = {}
for key, _ in pairs(languages) do
	filetype_set[key] = true
end

local filetypes = {}
for key, _ in pairs(filetype_set) do
	table.insert(filetypes, key)
end

return {
	cmd = {
		vim.fn.stdpath("data") .. "/lspinstall/efm/efm-langserver",
		"-logfile",
		vim.fn.stdpath("data") .. "/efm.log",
	},
	on_attach = on_attach,
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { "package.json" },
		languages = languages,
	},
	filetypes = filetypes,
}
