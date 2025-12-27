-- 1. Core Settings (Must load first for mapleader)
require("charan.core.options")
require("charan.core.keymaps")
require("charan.core.autocmds")

-- 2. Install Plugins (vim.pack.add)
require("charan.plugins")

-- 3. Load Plugin Configurations
require("charan.plugins.telescope")
require("charan.plugins.treesitter")
require("charan.plugins.cmp")
require("charan.plugins.lsp")
require("charan.plugins.harpoon")
require("charan.plugins.diffview")

-- 4. UI & Extras (Can be moved to own file if preferred)
require("fidget").setup({})
require("mason").setup({})
require("rose-pine").setup({
    disable_background = true,
    disable_italics = true,
})
vim.cmd("colorscheme rose-pine")
