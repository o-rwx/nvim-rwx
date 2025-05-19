return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<c- >]],
		on_create = function(term)
			local opts = { buffer = term.bufnr }
			vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", opts)
		end,
		shading_factor = -20,
		direction = "horizontal",
	},
}
