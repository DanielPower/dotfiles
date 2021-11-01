return function()
	local whichkey = require("which-key")

	local prettier = function()
		return {
			exe = "prettier",
			args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end

	local black = function()
		return {
			exe = "black",
			args = { "--quiet", "-" },
			stdin = true,
		}
	end

	local isort = function()
		return {
			exe = "isort",
			args = { "-" },
			stdin = true,
		}
	end

	local stylua = function()
		return {
			exe = "stylua",
			args = { "-" },
			stdin = true,
		}
	end

	require("formatter").setup({
		logging = false,
		filetype = {
			javascript = { prettier },
			javascriptreact = { prettier },
			typescript = { prettier },
			typescriptreact = { prettier },
			scss = { prettier },
			json = { prettier },
			lua = { stylua },
			python = { isort, black },
			html = { prettier },
			yaml = { prettier },
		},
	})

	vim.api.nvim_exec(
		[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.lua,*.json,*.py,*.scss,*.html,*.yaml,*.yml FormatWrite
augroup END
]],
		true
	)
end
