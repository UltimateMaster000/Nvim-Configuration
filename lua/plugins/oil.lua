local leader = vim.g.mapleader or " "

return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
	default_file_explorer = true,
	delete_to_trash = false,
	keymaps = {
		["-"] = { "actions.parent", mode = "n" },
		["g?"] = { "actions.show_help", mode = "n" },
	}
	
  },
  keys = {
     {"<leader>pv", "<CMD>Oil<CR>", desc = "Open oil in cwd"}
     },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  
}
