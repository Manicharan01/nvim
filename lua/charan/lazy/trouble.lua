return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>td", function()
			vim.cmd("Trouble diagnostics toggle")
		end)({ desc = "Trouble Diagnostics" })
		vim.keymap.set("n", "<leader>tq", function()
			vim.cmd("Trouble qflist toggle")
		end)
	end,
}
