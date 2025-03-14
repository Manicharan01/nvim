return {
    "eandrju/cellular-automaton.nvim",
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
    "folke/which-key.nvim",
    "kyazdani42/nvim-web-devicons",
    {
        "mbbill/undotree",

        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },
    {
        "xzbdmw/colorful-menu.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {},
    },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
}
