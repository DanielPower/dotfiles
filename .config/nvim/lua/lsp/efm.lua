local prettier = {
	formatCommand = "prettierd ${INPUT}",
	formatStdin = true,
}

local stylua = {
	formatCommand = "stylua -",
	formatStdin = true,
}

local mypy = {
	lintCommand = "mypy ${INPUT} --show-column-numbers --show-error-codes --no-error-summary",
	lint = true,
}

local actionlint = {
	lintCommand = "actionlint -",
	lintStdin = true,
}

local languages = {
	javascript = { prettier },
	javascriptreact = { prettier },
	typescript = { prettier },
	typescriptreact = { prettier },
	python = { mypy },
	yaml = { actionlint },
	lua = { stylua },
	scss = { prettier },
	css = { prettier },
	json = { prettier },
	jsonc = { prettier },
	graphql = { prettier },
	markdown = { prettier },
	html = { prettier },
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
		"efm-langserver",
		"-logfile",
		vim.fn.stdpath("data") .. "/efm.log",
	},
	root_dir = require("lspconfig").util.root_pattern({ ".git" }),
	init_options = { documentFormatting = true },
	settings = {
		languages = languages,
	},
	filetypes = filetypes,
}
