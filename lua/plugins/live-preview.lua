return {
  {
    "brianhuster/live-preview.nvim",
    -- Only load the plugin when running these specific user commands
    cmd = { "LivePreview" },
    -- Or load it immediately for specific web/document filetypes
    ft = { "html", "css", "markdown", "asciidoc", "svg" },
    config = function()
      require("live-preview").setup({
        -- Port to run the local preview server on
        port = 5500, 
        
        -- Browser to open the preview in (nil defaults to system default)
        browser = nil, 
        
        -- Automatically open the browser when starting the server
        browser_auto_open = true,
      })

      -- Quick keymap to toggle the live preview server
      vim.keymap.set("n", "<leader>lp", "<cmd>LivePreview start<cr>", { desc = "Start Live Preview" })
      vim.keymap.set("n", "<leader>lk", "<cmd>LivePreview stop<cr>", { desc = "Stop Live Preview" })
    end,
  }
}
