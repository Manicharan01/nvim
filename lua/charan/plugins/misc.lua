vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")
vim.cmd("packadd matchit")
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Open Built-in Undotree" })

require("fidget").setup({})
require("mason").setup({})

local status, fidget = pcall(require, "fidget")
if not status then return end

fidget.setup({
    notification = {
        override_vim_notify = true,
    },
})
