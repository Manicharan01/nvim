return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    "mbbill/undotree",
    "folke/zen-mode.nvim",
    "github/copilot.vim",
    'nvim-tree/nvim-web-devicons',
    'echasnovski/mini.icons',
}

--[[
--'nvim-treesitter/playground',
--'rafamadriz/friendly-snippets',
--]]
