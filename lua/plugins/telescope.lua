local builtin = require("telescope.builtin")

return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
  },
  -- Add the keys mapping here
  
  keys = {
    {"<leader>ff", builtin.find_files, desc = "Find Files"},
    {"<leader>fg", builtin.live_grep, desc = "Live Grep"},
    {"<leader>fh", builtin.help_tags, desc = "Help Tags"},
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          ["i"] = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = false,
            ["<C-p>"] = false,
          },
          ["n"] = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = false,
            ["<C-p>"] = false,
          },
        },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
        },
      },
    })
    
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
  end,
}
