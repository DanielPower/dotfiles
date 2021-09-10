local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0
		and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
				:sub(col, col)
				:match("%s")
			== nil
end

local tab_mapping = function(fallback)
	if vim.fn.pumvisible() == 1 then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<C-n>", true, true, true),
			"n",
			true
		)
	elseif has_words_before() and luasnip.expand_or_jumpable() then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
			"",
			true
		)
	else
		fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
	end
end

local shift_tab_mapping = function()
	if vim.fn.pumvisible() == 1 then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<C-p>", true, true, true),
			"n",
			true
		)
	elseif luasnip.jumpable(-1) then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
			"",
			true
		)
	end
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping(tab_mapping, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(shift_tab_mapping, { "i", "s" }),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "luasnip" },
	},
})
