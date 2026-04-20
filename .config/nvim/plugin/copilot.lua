vim.pack.add({ "https://github.com/zbirenbaum/copilot.lua" })

require("copilot").setup({
	panel = {
		enabled = false,
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<C-CR>",
			accept_word = "<C-l>",
			accept_line = "<C-;>",
			next = "<C-j>",
			prev = "<C-k>",
		},
	},
	filetypes = {
		lua = true,
		javascript = true,
		javascriptreact = true,
		typescript = true,
		typescriptreact = true,
		svelte = true,
		python = true,
		html = true,
		css = true,
		scss = true,
		markdown = true,
	},
})
