vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if
			ev.data.spec.name == "nvim-treesitter"
			and (ev.data.kind == "install" or ev.data.kind == "update")
		then
			vim.cmd("TSInstall all")
			vim.cmd("TSUpdate")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		if lang and vim.treesitter.language.add(lang) then
			vim.treesitter.start(ev.buf, lang)
		end
	end,
})
