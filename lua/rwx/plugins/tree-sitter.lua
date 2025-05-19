return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { 
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context", 
    },
    opts = {},
    config = function ()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "python",
          "rust",
          "javascript",
          "html"
        },
        auto_install = false,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
}
