return {
	"stevearc/conform.nvim",
	event = { "BufReadpre", "BufNewFile" },

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "fixjson" },
				rust = { "ast-grep" },
			},

			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
