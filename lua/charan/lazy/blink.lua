return {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        'L3MON4D3/LuaSnip',
        version = 'v2.*'
    },


    opts = {
        keymap = { preset = 'default' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
            kind_icons = {
                Snippet = "",
            },
        },

        signature = { enabled = true },

        snippets = { preset = 'luasnip' },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
    },
}
