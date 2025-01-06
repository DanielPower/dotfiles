local keymap = Keymap({
	["<C-/>"] = {
		function(nvimtree)
			nvimtree.toggle()
		end,
		"Toggle file tree",
	},
})

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	lazy = true,
	keys = keymap.keys,
	config = function()
		local nvimtree = require("nvim-tree")
		keymap.bind(nvimtree)
		nvimtree.setup({ -- BEGIN_DEFAULT_OPTS
			auto_reload_on_write = true,
			disable_netrw = false,
			hijack_cursor = false,
			hijack_netrw = true,
			hijack_unnamed_buffer_when_opening = false,
			sort = {
				sorter = "name",
				folders_first = true,
			},
			root_dirs = {},
			prefer_startup_root = false,
			sync_root_with_cwd = false,
			reload_on_bufenter = false,
			respect_buf_cwd = false,
			on_attach = "default",
			select_prompts = false,
			view = {
				centralize_selection = false,
				cursorline = true,
				debounce_delay = 15,
				width = 30,
				side = "left",
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = math.min(screen_w - 2, 80)
						local window_h = screen_h - 4
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							width = window_w,
							height = window_h,
							row = center_y,
							col = center_x,
						}
					end,
				},
			},
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "none",
				highlight_modified = "none",
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,
				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "before",
					modified_placement = "after",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						modified = "●",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
			system_open = {
				cmd = "",
				args = {},
			},
			diagnostics = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			filters = {
				git_ignored = true,
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				custom = {},
				exclude = {},
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = {},
			},
			git = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				disable_for_dirs = {},
				timeout = 400,
			},
			modified = {
				enable = false,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = false,
					restrict_above_cwd = false,
				},
				expand_all = {
					max_folder_discovery = 300,
					exclude = {},
				},
				file_popup = {
					open_win_config = {
						col = 1,
						row = 1,
						relative = "cursor",
						border = "shadow",
						style = "minimal",
					},
				},
				open_file = {
					quit_on_open = false,
					eject = true,
					resize_window = true,
					window_picker = {
						enable = true,
						picker = "default",
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
				remove_file = {
					close_window = true,
				},
			},
			trash = {
				cmd = "gio trash",
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			tab = {
				sync = {
					open = false,
					close = false,
					ignore = {},
				},
			},
			notify = {
				threshold = vim.log.levels.INFO,
				absolute_path = true,
			},
			ui = {
				confirm = {
					remove = true,
					trash = true,
				},
			},
			experimental = {},
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					dev = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		}) -- END_DEFAULT_OPTS
		vim.keymap.set("n", "<C-/>", ":NvimTreeOpen<CR>", { noremap = true, silent = true })
	end,
}
