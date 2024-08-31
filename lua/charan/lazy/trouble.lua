return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup({})
		vim.keymap.set("n", "<leader>td", function()
			vim.cmd("Trouble diagnostics toggle")
		end, { desc = "Toggle Trouble Diagnostics" })

		vim.keymap.set("n", "<leader>tq", function()
			vim.cmd("Trouble qflist toggle")
		end, { desc = "Toggle Trouble Quickfix" })

		vim.keymap.set("n", "<leader>gd", function()
			vim.cmd("Trouble lsp_definitions toggle")
		end, { desc = "Toggle Trouble Definitions" })

		vim.keymap.set("n", "<leader>ty", function()
			vim.cmd("Trouble lsp_type_definitions toggle")
		end, { desc = "Toggle Trouble Type Definitions" })

		vim.keymap.set("n", "<leader>ti", function()
			vim.cmd("Trouble lsp_incoming_calls toggle")
		end, { desc = "Toggle Trouble Incoming Calls" })

		vim.keymap.set("n", "<leader>to", function()
			vim.cmd("Trouble lsp_outgoing_calls toggle")
		end, { desc = "Toggle Trouble Outgoing Calls" })
	end,
}
