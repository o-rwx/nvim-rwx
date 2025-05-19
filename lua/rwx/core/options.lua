-- Define <leader> and <localleader> keys
vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<cr>")

-- General options
vim.o.completeopt = "menuone,noselect,popup,fuzzy"
vim.opt.fileencoding = "utf-8"

vim.o.conceallevel = 0
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "v"

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr" -- use tree-sitter for folding method
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.termguicolors = true -- enable rgb colors
vim.o.cursorline = true
vim.o.winborder = "rounded"

vim.o.showmode = false
vim.o.cmdheight = 2

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "auto"
vim.o.showtabline = 0

vim.o.pumheight = 10 -- max heiht of completion menu
vim.o.pumblend = 10

vim.o.list = true
vim.opt.listchars = {
  tab = "  ",
  trail = "·",
  extends = "»",
  precedes = "«",
}

vim.opt.diffopt:append("linematch:60")

vim.o.confirm = true
vim.o.updatetime = 200 -- (4000 default)
vim.o.timeoutlen = 600 -- (1000 default)

vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.smartindent = true
vim.o.shiftround = true
vim.o.shiftwidth = 0 -- 0 to follow tabstop value
vim.o.tabstop = 2 -- tab width
vim.o.softtabstop = 2
vim.o.expandtab = true -- tabs are spaces
vim.o.wrap = false

vim.o.scrolloff = 8
vim.o.sidescrolloff = 10

vim.o.undofile = false -- disable persistent undo
vim.o.backup = false

vim.opt.shortmess:append("c")
vim.opt.isfname:append("@-@")

-- Diagnostic settings
local diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}
vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostics.Error,
      [vim.diagnostic.severity.WARN] = diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = diagnostics.Info,
    },
  },
}

-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
