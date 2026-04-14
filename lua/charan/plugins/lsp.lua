local status, blink = pcall(require, "blink.cmp")
if not status then return end

blink.setup({
    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },

    snippets = { preset = 'default' },

    keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>']     = { 'hide', 'fallback' },
        ['<CR>']      = { 'accept', 'fallback' },
        ['<C-y>']     = { 'accept', 'fallback' },
        ['<C-p>']     = { 'select_prev', 'fallback' },
        ['<C-n>']     = { 'select_next', 'fallback' },
        ['<C-b>']     = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>']     = { 'scroll_documentation_down', 'fallback' },
    },

    completion = {
        menu = {
            border = 'rounded', -- You can also use 'single', 'double', or 'solid'
        },
        documentation = {
            auto_show = true,
            window = {
                border = 'rounded',
            },
        },
    },

    sources = {
        default = { 'lsp', 'snippets', 'path', 'buffer' },
    },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- 1. Setup Servers
vim.lsp.config['lua_ls'] = {
    capabilities = capabilities,
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
    capabilities = capabilities,
    cmd = { "zls" },
    filetypes = { "zig", "zir" },
    name = "zls",
    root_markers = { "zls.json", "build.zig", ".git" },
    workspace_required = false
}

vim.lsp.config['clangd'] = {
    capabilities = vim.tbl_deep_extend("force", capabilities, {
        offsetEncoding = { "utf-8", "utf-16" },
        textDocument = {
            completion = {
                editsNearCursor = true
            }
        }
    }),
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    name = "clangd",
    root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" }
}

vim.lsp.config['gopls'] = {
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    name = "gopls",
}

vim.lsp.config['pyrefly'] = {
    capabilities = capabilities,
    cmd = { "pyrefly", "lsp" },
    filetypes = { "python" },
    name = "pyrefly",
    root_markers = { "pyrefly.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" }
}

vim.lsp.config['tombi'] = {
    capabilities = capabilities,
    cmd = { "tombi", "lsp" },
    filetypes = { "toml" },
    name = "tombi",
    root_markers = { "tombi.toml", "pyproject.toml", ".git" }
}

vim.lsp.config['rust_analyzer'] = {
    capabilities = capabilities,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    name = "rust_analyzer",
    settings = {
        ["rust-analyzer"] = {
            lens = {
                debug = {
                    enable = true
                },
                enable = true,
                implementations = {
                    enable = true
                },
                references = {
                    adt = {
                        enable = true
                    },
                    enumVariant = {
                        enable = true
                    },
                    method = {
                        enable = true
                    },
                    trait = {
                        enable = true
                    }
                },
                run = {
                    enable = true
                },
                updateTest = {
                    enable = true
                }
            }
        }
    }
}

vim.lsp.config['tsgo'] = {
    capabilities = capabilities,
}

vim.lsp.enable({ 'lua_ls', 'zls', 'clangd', 'gopls', 'pyrefly', 'rust_analyzer', 'tombi', 'tsgo' })
