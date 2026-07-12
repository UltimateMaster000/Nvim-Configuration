-- show godot error diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- add pasting to insert mode
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
-- add copying selected text in visual mode
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>pwd<cr>", { desc = "Set CWD to current file" })
