return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
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
					accept_word = false,
					accept_line = false,
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
			copilot_node_command = "node", -- Node.js version must be > 16.x
			server_opts_overrides = {},
		})
	end,
}
