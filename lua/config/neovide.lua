-- Set the font to JetBrainsMono
vim.o.guifont = "JetBrainsMono Nerd Font:h12"

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
vim.opt.clipboard = "unnamedplus"
-- Paste in insert mode

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


