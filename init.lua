vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.title = true
vim.opt.titlestring = "Ultimate Neovim"
require("config.lazy")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.cmd[[colorscheme tokyonight-moon]]
vim.opt.nu = true
vim.opt.relativenumber = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cs",
    callback = function()
        vim.opt_local.expandtab = true  -- soft tabs
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

if vim.g.neovide then

-- Get the 'Normal' highlight group attributes
local normal_hl = vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") })

-- Set the background color (fallback to black if not found)
if normal_hl.bg then
    vim.g.neovide_title_background_color = string.format("%x", normal_hl.bg)
end

-- Set the text color to your theme's foreground color (fallback to white if not found)
if normal_hl.fg then
    vim.g.neovide_title_text_color = string.format("%x", normal_hl.fg)
end  

vim.keymap.set("n", "<F11>", function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = "Toggle Borderless Fullscreen" })
  -- 1. Set a clean, modern font for the GUI (Adjust font name/size as desired)
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"
  vim.opt.clipboard = "unnamedplus"
  -- Paste in insert mode
  vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
  -- Copy in visual mode
  vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

  -- 2. Customize the famous smooth cursor particles
  vim.g.neovide_cursor_animation_length = 0.04  -- Speed of the cursor tail
  vim.g.neovide_cursor_vfx_mode = "none"     -- Try: "railgun", "torpedo", "pixel", or "none"

  -- 3. Adjust window transparency/blur
  vim.g.neovide_opacity = 0.98
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_confirm_quit = true
  vim.o.winblend = 15   -- Controls floating window background transparency
  vim.api.nvim_set_current_dir(vim.env.PWD or vim.fn.expand('~'))

end
