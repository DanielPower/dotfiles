local neorg = require("neorg")

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.keybinds"] = {
			config = {
				default_keybinds = true, -- Generate the default keybinds
				neorg_leader = "<Leader>o", -- This is the default if unspecified
			},
		},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					main_workspace = "~/neorg",
				},
			},
		},
	},
})
