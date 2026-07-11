-- Load Leader Keys First
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable Netrw From Loading
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Vim Options
vim.opt.title = true
vim.opt.titlestring = "Ultimate Neovim"
vim.opt.nu = true
vim.opt.relativenumber = true

-- Load Config Files
require("config.global-keybinds")
require("config.lazy")
require("config.file-types")

vim.cmd[[colorscheme tokyonight-moon]]
if vim.g.neovide then require("config.neovide") end







