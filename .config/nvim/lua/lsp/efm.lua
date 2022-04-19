local on_attach = require("lsp.on_attach")

local prettier = {
	formatCommand = "prettierd ${INPUT}",
	formatStdin = true,
}

local flake8 = {
	lintCommand = "flake8 --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
}

local black = {
	formatCommand = "black --quiet -",
	formatStdin = true,
}

local isort = {
	formatCommand = "isort --quiet -",
	formatStdin = true,
}

local stylua = {
	formatCommand = "stylua -",
	formatStdin = true,
}

local languages = {
	javascript = { prettier },
	javascriptreact = { prettier },
	typescript = { prettier },
	typescriptreact = { prettier },
	python = { flake8, isort, black },
	html = { prettier },
	yaml = { prettier },
	lua = { stylua },
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
		vim.fn.stdpath("data") .. "/lsp_servers/efm/efm-langserver",
		"-logfile",
		vim.fn.stdpath("data") .. "/efm.log",
	},
	root_dir = require("lspconfig").util.root_pattern({ "." }),
	on_attach = on_attach,
	init_options = { documentFormatting = true },
	settings = {
		languages = languages,
	},
	filetypes = filetypes,
}
