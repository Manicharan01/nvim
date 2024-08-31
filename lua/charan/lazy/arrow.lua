return {
	"otavioschwanck/arrow.nvim",

	event = { "VeryLazy" },

	config = function()
		require("arrow").setup({
			show_icons = true,
		})
		local persist = require("arrow.persist")

		vim.keymap.set("n", "<leader>l", persist.toggle)
		vim.keymap.set("n", "<C-h>", persist.next)
		vim.keymap.set("n", "<C-l>", persist.previous)
	end,
}
