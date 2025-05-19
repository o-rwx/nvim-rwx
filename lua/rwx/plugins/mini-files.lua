return {
  'echasnovski/mini.files',
  version = '*',
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "-", "<CMD>lua MiniFiles.open()<CR>", desc = "Open File" },
  },
}
