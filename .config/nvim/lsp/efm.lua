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

local ruff = {
	lintCommand = "ruff check --stdin-filename ${INPUT} --output-format concise --quiet -",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	formatCommand = "ruff format --stdin-filename ${INPUT} --quiet -",
	formatStdin = true,
}

local rustfmt = {
	formatCommand = "rustfmt --emit=stdout",
	formatStdin = true,
}

local languages = {
	astro = { prettier },
	javascript = { prettier },
	javascriptreact = { prettier },
	typescript = { prettier },
	typescriptreact = { prettier },
	python = { mypy, ruff },
	yaml = { actionlint, prettier },
	lua = { stylua },
	scss = { prettier },
	css = { prettier },
	json = { prettier },
	jsonc = { prettier },
	graphql = { prettier },
	markdown = { prettier },
	html = { prettier },
	svelte = { prettier },
	rust = { rustfmt },
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
	init_options = { documentFormatting = true, documentRangeFormatting = true },
	settings = {
		languages = languages,
	},
	filetypes = filetypes,
}
