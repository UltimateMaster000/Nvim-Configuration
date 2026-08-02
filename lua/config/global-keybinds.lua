-- show godot error diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- add pasting to insert mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
-- add copying selected text in visual mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>pwd<cr>", { desc = "Set CWD to current file" })

vim.keymap.set("n", "<leader>tv", function()
  local cwd = vim.fn.expand("%:p:h")
  local height = math.floor(vim.o.lines / 3)

  vim.cmd("botright " .. height .. "sp | lcd " .. cwd .. " | terminal")
end, { desc = "Open terminal split vertically" })

vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", {desc = "Close current window"})
