-- Standalone server profile for Neovim 0.12.5. No downloads or third-party plugins.
if vim.fn.has("nvim-0.12") ~= 1 then
    error("The server profile requires Neovim 0.12 or newer (tested on 0.12.5)")
end

-- Also support `nvim -u /path/to/server/init.lua` without loading the desktop profile.
local config = vim.fs.dirname(debug.getinfo(1, "S").source:sub(2))
vim.opt.runtimepath:prepend(config)
package.path = config .. "/lua/?.lua;" .. config .. "/lua/?/init.lua;" .. package.path

require("server.options")
require("server.tools")
require("server.keymaps")
require("server.autocmds")
require("server.lsp")

-- Only bundled runtime plugins; :packadd never downloads anything.
for _, name in ipairs({ "netrw", "matchit", "cfilter", "nvim.undotree", "nvim.difftool" }) do
    vim.cmd.packadd(name)
end
vim.cmd.colorscheme("habamax")
