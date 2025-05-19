-- local Lsp = require "rwx.utils.lsp"

return {
	name = "pylsp",
	cmd = { "pylsp" },
	-- on_attach = Lsp.on_attach,
	filetypes = { "python" },
	root_markers = { "requirements.txt", "mise.toml", "pyproject.toml", ".git" },
}
