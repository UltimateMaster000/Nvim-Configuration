vim.o.guifont = "JetBrainsMono Nerd Font:h12"

vim.g.neovide_cursor_animation_length = 0.04  -- Speed of the cursor tail
vim.g.neovide_cursor_vfx_mode = "none"     -- Try: "railgun", "torpedo", "pixel", or "none"

vim.g.neovide_opacity = 1.0
vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_hide_mouse_when_typing = false
vim.g.neovide_confirm_quit = true
vim.api.nvim_set_current_dir(vim.env.PWD or vim.fn.expand('~'))

vim.keymap.set("n", "<F11>", function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = "Toggle Borderless Fullscreen" })
