vim.api.nvim_create_autocmd("FileType", {
    pattern = "cs",
    callback = function()
        pcall(vim.treesitter.start)
        vim.opt_local.expandtab = true  -- soft tabs
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.opt_local.expandtab = true  
        vim.opt_local.tabstop = 2       
        vim.opt_local.shiftwidth = 2    
    end,
})

vim.api.nvim_create_autocmd("LspAttach", { desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf}

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  end,
})

-- Add this to your LSP config (e.g., inside on_attach or globally)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      -- Turn off semantic token highlighting for all language servers
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
