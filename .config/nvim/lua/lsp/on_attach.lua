local saga_action = require("lspsaga.action")
local saga_codeaction = require("lspsaga.codeaction")
local saga_diagnostic = require("lspsaga.diagnostic")
local saga_hover = require("lspsaga.hover")
local saga_provider = require("lspsaga.provider")
local saga_rename = require("lspsaga.rename")
local saga_signaturehelp = require("lspsaga.signaturehelp")
local wk = require("which-key")

return function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	wk.register({
		["<leader>K"] = { saga_signaturehelp.signature_help, "Show signature help" },
		["<leader>ca"] = { saga_codeaction.code_action, "Code actions" },
		["<leader>cd"] = { saga_diagnostic.show_line_diagnostics, "Show line diagnostics" },
		["<leader>pd"] = { saga_provider.preview_definition, "Preview definition" },
		["<leader>rr"] = { saga_rename.rename, "Rename symbol" },
		["K"] = { saga_hover.render_hover_doc, "Show definition" },
		["f"] = { vim.lsp.buf.formatting },
		["gD"] = { vim.lsp.buf.declaration, "Go to declaration" },
		["gd"] = { vim.lsp.buf.definition, "Go to definition" },
		["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
		["gr"] = { saga_provider.lsp_finder, "Find references" },
		["<C-f>"] = {
			function()
				saga_action.smart_scroll_with_saga(1)
			end,
			"Scroll up",
		},
		["<C-b>"] = {
			function()
				saga_action.smart_scroll_with_saga(-1)
			end,
			"Scroll down",
		},
	}, {
		buffer = bufnr,
	})
end
