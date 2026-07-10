return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  lazy = false,

  config = function()
    require("nvim-treesitter").setup({
      install = { compiler = "gcc" },
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "gdscript", "godot_resource", "gdshader"
      },
      highlight = { enable = true },
      indent = { enable = true },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "gdscript", "gdshader", "godot_resource" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
