local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local CharanGroup = augroup("Charan", {})
local yank_group = augroup("HighlightYank", {})

-- Format on save
autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        vim.lsp.buf.format({
            bufnr = args.buf,
            timeout_ms = 2000,
        })
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

autocmd("LspAttach", {
    group = augroup("CharanLsp", {}),
    callback = function(e)
        local opts = { buffer = e.buf }

        local client = vim.lsp.get_client_by_id(e.data.client_id)

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = e.buf })
        end

        local function show_float()
            vim.diagnostic.open_float()
        end

        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ timeout_ms = 2000 })
        end, { desc = "Format current buffer" })
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -1, on_jump = show_float })
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = 1, on_jump = show_float })
        end, opts)
        vim.keymap.set("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = e.buf }), { bufnr = e.buf })
        end, { buffer = e.buf, desc = "Toggle Inlay Hints" })
    end,
})
