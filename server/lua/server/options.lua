vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.winborder = "rounded"
opt.termguicolors = true
opt.updatetime = 300
opt.timeoutlen = 500
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.splitbelow = true
opt.splitright = true
opt.mouse = "" -- Leave terminal selection available over SSH.
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.modeline = false
opt.exrc = false
opt.completeopt = { "menu", "menuone", "noselect", "fuzzy" }
opt.complete = { ".", "w", "b" }
opt.wildmode = "longest:full,full"
opt.wildoptions = { "pum", "fuzzy" }
opt.path = { ".", "", "**" }
opt.wildignore:append({ "*/.git/*", "*/node_modules/*", "*/.venv/*", "*/target/*", "*.o", "*.so" })
opt.laststatus = 3
opt.statusline = "%f %h%m%r%=%{v:lua.vim.lsp.status()}  %y  %l:%c  %p%%"

-- Keep state out of the working tree and isolate it via NVIM_APPNAME.
-- Elevated editing should not retain copies of privileged file contents.
local elevated = vim.env.SUDO_USER ~= nil or (vim.uv.getuid and vim.uv.getuid() == 0)
opt.undofile = not elevated
if elevated then
    opt.shadafile = "NONE"
else
    local undo = vim.fn.stdpath("state") .. "/undo"
    vim.fn.mkdir(undo, "p", 448) -- 0700 on Unix.
    opt.undodir = undo
end

vim.g.editorconfig = true
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_liststyle = 3
