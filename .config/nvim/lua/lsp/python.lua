local on_attach = require("lsp.on_attach")
local util = require("lspconfig.util")

return {
	root_dir = function(fname)
		-- Hack for Gradient
		local git_ancestor = util.find_git_ancestor(fname)
		if git_ancestor == "/Users/daniel/Development/gradient" then
			return git_ancestor
		end

		-- General root detection copied from lspconfig
		local root_files = {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			"pyrightconfig.json",
		}
		return util.root_pattern(unpack(root_files))(fname)
			or util.find_git_ancestor(fname)
			or util.path.dirname(fname)
	end,
}
