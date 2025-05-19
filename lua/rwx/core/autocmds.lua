local function augroup(name)
	return vim.api.nvim_create_augroup("rwx_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"checkhealth",
		"help",
		"lspinfo",
		"notify",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- Set filetype for .env and .env.* files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("env_filetype"),
	pattern = { "*.env", ".env.*" },
	callback = function()
		vim.opt_local.filetype = "sh"
	end,
})

-- Toggle line numbers between modes { 'n', 'i' }
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdLineLeave", "WinEnter" }, {
	group = augroup("line_numbers_relative"),
	pattern = "*",
	callback = function()
		if vim.opt.number and vim.api.nvim_get_mode().mode ~= "i" then
			vim.opt.relativenumber = true
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdLineEnter", "WinLeave" }, {
	group = augroup("line_numbers"),
	pattern = "*",
	callback = function()
		if vim.opt.number then
			vim.opt.relativenumber = false
			if not vim.tbl_contains({ "@", "-" }, vim.v.event.cmdtype) then
				vim.cmd("redraw")
			end
		end
	end,
})

-- LSP
-- local completion = vim.g.completion_mode or "blink"
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		if client then
-- 			-- Built-in completion
-- 			if completion == "native" and client:supports_method("textDocument/completion") then
-- 				vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
-- 			end
-- 			-- Inlay hints
-- 			if client:supports_method("textDocument/inlayHints") then
-- 				vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
-- 			end
-- 		end
-- 	end,
-- })
