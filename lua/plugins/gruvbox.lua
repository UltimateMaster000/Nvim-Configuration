return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    contrast = "",
    palette_overrides = { dark0 = "#1d2021" },
  },
  init = function()
    vim.cmd.colorscheme("gruvbox")
  end,
}
