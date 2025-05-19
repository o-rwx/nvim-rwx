--  :h lsp-config
local completion = vim.g.completion_mode or "blink"
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			-- Built-in completion
			if completion == "native" and client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			end
			-- Inlay hints
			if client:supports_method("textDocument/inlayHints") then
				vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
			end
		end
	end,
})

-- Enable LSP servers NeoVIM 0.11+
vim.lsp.enable({
	"lua_ls",
	"rust-analyzer",
	"pylsp",
})
