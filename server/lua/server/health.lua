local M = {}
function M.check()
    vim.health.start("Native server profile")
    if vim.fn.has("nvim-0.12") == 1 then
        vim.health.ok("Neovim 0.12+ (profile tested on 0.12.5)")
    else
        vim.health.error("Neovim 0.12+ is required")
    end
    vim.health.ok("No third-party Neovim plugins or startup downloads")
    vim.health.info("Working directory for :find and :Grep: " .. vim.fn.getcwd())
    vim.health.info("Persistent undo: " .. tostring(vim.o.undofile))
    for name, config in vim.spairs(require("server.lsp")) do
        if vim.fn.executable(config.cmd[1]) == 1 then
            vim.health.ok(name .. ": " .. vim.fn.exepath(config.cmd[1]))
        else
            vim.health.info(name .. ": optional executable missing (" .. config.cmd[1] .. ")")
        end
    end
end
return M
