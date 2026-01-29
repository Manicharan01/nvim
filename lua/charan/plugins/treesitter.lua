local status, configs = pcall(require, "nvim-treesitter.configs")
if status then
    configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "zig", "go" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    })
end
