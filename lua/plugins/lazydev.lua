return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- Only load for Lua files
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luvit/library", words = { "vim%.uv" } },
      },
    },
  },
}
