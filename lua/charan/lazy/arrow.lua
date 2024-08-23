return {
    "otavioschwanck/arrow.nvim",
    config = function()
        require("arrow").setup({})
        local persist = require("arrow.persist")

        vim.keymap.set("n", "<leader>l", persist.toggle)
        vim.keymap.set("n", "<C-h>", persist.next)
        vim.keymap.set("n", "<C-l>", persist.previous)
    end,
}
