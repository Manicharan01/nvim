-- 1. Core Settings (Must load first for mapleader)
require("vim._core.ui2").enable({})
require("charan.core.options")
require("charan.core.keymaps")
require("charan.core.autocmds")

-- 2. Install Plugins (vim.pack.add)
require("charan.plugins")

-- 3. Load Plugin Configurations
require("charan.plugins.colorscheme")
require("charan.plugins.telescope")
require("charan.plugins.treesitter")
require("charan.plugins.lsp")
require("charan.plugins.harpoon")
require("charan.plugins.misc")
require("charan.plugins.base16")

-- require("charan.caelus.init").colorscheme()
