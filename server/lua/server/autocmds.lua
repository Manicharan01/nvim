local group = vim.api.nvim_create_augroup("ServerProfile", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.hl.on_yank({ higroup = "IncSearch", timeout = 120 })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "yaml", "json", "jsonc", "lua", "sh", "toml" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "go", "make" },
    callback = function()
        vim.opt_local.expandtab = false
    end,
})
vim.api.nvim_create_autocmd("TermOpen", {
    group = group,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end,
})

-- Use parsers already installed in the runtime. Fall back to native syntax.
vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
        if vim.bo[args.buf].buftype == "" then
            pcall(vim.treesitter.start, args.buf)
        end
    end,
})
