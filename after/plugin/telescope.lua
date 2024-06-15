local builtin = require('telescope.builtin')
print("great success", vim.bo.ft, bufnr, vim.inspect(opts))
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_strings({ search = vim.fn.input("Grep > ") });

end)
