return {
    'ibhagwan/fzf-lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
    },

    config = function()
        require('fzf-lua').setup()

        local fzf = require('fzf-lua')
        vim.keymap.set("n", "<leader>pf", fzf.files, {})
        vim.keymap.set("n", "<leader>pws", fzf.grep_cword, {})
        vim.keymap.set("n", "<leader>pWs", fzf.grep_cWORD, {})
        vim.keymap.set("n", "<leader>pg", fzf.grep, {})
        vim.keymap.set("n", "<leader>vh", fzf.helptags, {})
    end,
}
