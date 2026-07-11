vim.api.nvim_create_autocmd("FileType", {
    pattern = "cs",
    callback = function()
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


