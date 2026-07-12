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
    {"<C-p>", function() 
      vim.cmd("cd %:p:h")
      vim.cmd("pwd")
      local git_root = vim.fs.root(0, ".git")
      if git_root then
        builtin.git_files()
      else
        print("Not in git repository!")
      end
    end, desc = "Search Git Files"},
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
