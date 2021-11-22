local on_attach = require("lsp.on_attach")

local flake8 = {
	lintCommand = "flake8 --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
}

local languages = {
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
		languages = languages,
	},
	filetypes = filetypes,
}
