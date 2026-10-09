-- Define native configurations locally; enable only executables already on PATH.
-- Server tools are optional and installed separately with the OS package manager.
local servers = {
    bashls = {
        cmd = { "bash-language-server", "start" }, filetypes = { "sh", "bash" },
        root_markers = { ".git" },
    },
    yamlls = {
        cmd = { "yaml-language-server", "--stdio" }, filetypes = { "yaml" },
        root_markers = { ".git" },
        settings = { yaml = { schemaStore = { enable = false }, validate = true } },
    },
    dockerls = {
        cmd = { "docker-langserver", "--stdio" }, filetypes = { "dockerfile" },
        root_markers = { "compose.yaml", "compose.yml", "docker-compose.yml", ".git" },
    },
    lua_ls = {
        cmd = { "lua-language-server" }, filetypes = { "lua" },
        root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
        settings = { Lua = {
            runtime = { version = "LuaJIT" }, diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false }, telemetry = { enable = false },
        } },
    },
    zls = {
        cmd = { "zls" }, filetypes = { "zig", "zir" },
        root_markers = { "zls.json", "build.zig", ".git" },
    },
    clangd = {
        cmd = { "clangd" }, filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
    },
    gopls = {
        cmd = { "gopls" }, filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
    },
    pyrefly = {
        cmd = { "pyrefly", "lsp" }, filetypes = { "python" },
        root_markers = { "pyrefly.toml", "pyproject.toml", ".git" },
    },
    tombi = {
        cmd = { "tombi", "lsp" }, filetypes = { "toml" },
        root_markers = { "tombi.toml", "pyproject.toml", ".git" },
    },
    rust_analyzer = {
        cmd = { "rust-analyzer" }, filetypes = { "rust" },
        root_markers = { "Cargo.toml", "rust-project.json", ".git" },
    },
}

for name, config in pairs(servers) do
    config.workspace_required = false -- Also edit standalone files under /etc.
    vim.lsp.config(name, config)
    if vim.fn.executable(config.cmd[1]) == 1 then
        vim.lsp.enable(name)
    end
end

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    update_in_insert = false,
    float = { border = "rounded", source = true },
    signs = { text = { [1] = "E", [2] = "W", [3] = "I", [4] = "H" } },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("ServerLsp", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
        if client:supports_method("textDocument/definition") then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition,
                { buffer = args.buf, desc = "Go to definition" })
        end
        -- K, grn, gra, grr, gO, [d, ]d and snippet Tab are native defaults.
    end,
})

return servers
