return {
	"stevearc/conform.nvim",
	event = { "BufReadpre", "BufNewFile" },

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
			},

			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
