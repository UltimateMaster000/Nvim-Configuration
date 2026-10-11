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
  local cwd

  -- Oil buffers: use the directory oil is showing
  local ok, oil = pcall(require, "oil")
  if ok and vim.bo.filetype == "oil" then
    cwd = oil.get_current_dir()
  end

  -- Normal buffers (or fallback): directory of the current file
  if not cwd or cwd == "" then
    cwd = vim.fn.expand("%:p:h")
  end

  -- Last resort for unnamed/special buffers
  if cwd == "" or vim.fn.isdirectory(cwd) == 0 then
    cwd = vim.fn.getcwd()
  end

  local height = math.floor(vim.o.lines / 3)

  vim.cmd("botright " .. height .. "split")
  vim.cmd("lcd " .. vim.fn.fnameescape(cwd))
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { desc = "Open terminal split at current dir" })

vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", {desc = "Close current window"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent=true})

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
