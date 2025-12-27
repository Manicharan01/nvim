-- 1. Setup Servers
vim.lsp.config['lua_ls'] = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    name = "lua_ls",
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            codeLens = { enable = true },
            diagnostics = { globals = { "vim", "it", "describe", "before_each", "after_each" } },
            hint = { enable = true, semicolon = "Disable" },
            runtime = { version = "LuaJIT" }
        }
    }
}

vim.lsp.config['zls'] = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    name = "zls",
    root_markers = { "zls.json", "build.zig", ".git" },
    workspace_required = false
}

vim.lsp.enable({ 'lua_ls', 'zls' })

-- 2. LspAttach Autocmd (Keymaps)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("CharanLsp", {}),
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", "<cmd>cnext<CR>zz")
        vim.keymap.set("n", "]d", "<cmd>cprev<CR>zz")
    end,
})
