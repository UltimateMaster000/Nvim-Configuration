return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    
    -- Required setup
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    -- Keymaps
    local main_list = function() return harpoon:list() end

    -- Mark a file
    vim.keymap.set("n", "<leader>a", function()
      main_list():add()
      print("📍 File harpooned!")
    end, { desc = "Harpoon: Add file" })

    -- Toggle UI menu
    vim.keymap.set("n", "<C-d>", function()
      harpoon.ui:toggle_quick_menu(main_list())
    end, { desc = "Harpoon: Toggle menu" })

    -- Quick navigation (1-4)
    vim.keymap.set("n", "<C-j>", function() main_list():select(1) end, { desc = "Harpoon: File 1" })
    vim.keymap.set("n", "<C-k>", function() main_list():select(2) end, { desc = "Harpoon: File 2" })
    vim.keymap.set("n", "<C-l>", function() main_list():select(3) end, { desc = "Harpoon: File 3" })
    vim.keymap.set("n", "<C-;>", function() main_list():select(4) end, { desc = "Harpoon: File 4" })
  end,
}
