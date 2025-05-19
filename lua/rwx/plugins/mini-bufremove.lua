return {
	{
		"echasnovski/mini.bufremove",
		version = false,
    opts = {},
    keys = {
      { "<leader>bd", function() MiniBufremove.delete() end, desc = "Delete Buffer" },
      { "<leader>bD", function() MiniBufremove.delete(0, true) end, desc = "Delete Buffer!" },
      { "<leader>bu", function() MiniBufremove.unshow() end, desc = "Unshow Buffer" },
      { "<leader>bw", function() MiniBufremove.wipeout() end, desc = "Wipeout Buffer" },
    },
	},
}
