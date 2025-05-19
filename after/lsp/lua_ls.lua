-- local Lsp = require "rwx.utils.lsp"

-- NOTE: mise use -g lua-language-server

return {
  name = "lua_ls",
  cmd = { "lua-language-server" },
  -- on_attach = Lsp.on_attach,
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
}
