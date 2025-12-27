local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local CharanGroup = augroup("Charan", {})
local yank_group = augroup("HighlightYank", {})

-- Reload helper
function R(name)
    return require("plenary.reload").reload_module(name)
end

-- Filetypes
vim.filetype.add({
    extension = { templ = "templ" },
})

-- Format on save
autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end
})

-- Highlight on Yank
autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Trim whitespace
autocmd({ "BufWritePre" }, {
    group = CharanGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
