-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/charan/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?.lua;/home/charan/.cache/nvim/packer_hererocks/2.1.1736781742/share/lua/5.1/?/init.lua;/home/charan/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?.lua;/home/charan/.cache/nvim/packer_hererocks/2.1.1736781742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/charan/.cache/nvim/packer_hererocks/2.1.1736781742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\n—\2\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\bvim\17dim_inactive\1\0\3\nshade\tdark\fenabled\1\15percentage\4³æÌ™\3³æŒþ\3\15background\1\0\1\tdark\nmocha\1\0\5\17dim_inactive\0\fflavour\nmocha\16term_colors\2\15background\0\27transparent_background\1\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3À\tbody\15lsp_expandš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\2À\3À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible£\n\1\0\14\0@\0œ\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0016\0\0\0'\2\a\0B\0\2\0029\0\b\0B\0\1\0026\1\0\0'\3\t\0B\1\2\0029\2\n\0019\2\2\0025\4\v\0=\0\f\4B\2\2\0019\2\r\0019\2\2\0025\4\14\0=\0\f\4B\2\2\0019\2\15\0019\2\2\0025\4\16\0=\0\f\4B\2\2\0019\2\17\0019\2\2\0025\4\18\0=\0\f\4B\2\2\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\23\0006\6\19\0009\6\24\0069\6\25\0069\6\26\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\27\0006\6\19\0009\6\24\0069\6\25\0069\6\28\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\29\0006\6\19\0009\6\24\0069\6\25\0069\6\30\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\31\0006\6\19\0009\6\24\0069\6\25\0069\6 \6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5!\0006\6\19\0009\6\24\0069\6\25\0069\6\"\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5#\0006\6\19\0009\6\24\0069\6\25\0069\6$\6B\2\4\0016\2\0\0'\4%\0B\2\2\0026\3\0\0'\5&\0B\3\2\0029\4\2\0025\6*\0005\a(\0003\b'\0=\b)\a=\a+\0069\a,\0029\a-\a9\a.\a5\t0\0009\n,\0029\n/\n)\füÿB\n\2\2=\n1\t9\n,\0029\n/\n)\f\4\0B\n\2\2=\n2\t9\n,\0029\n3\nB\n\1\2=\n4\t9\n,\0029\n5\n5\f6\0B\n\2\2=\n7\t9\n,\0023\f8\0005\r9\0B\n\3\2=\n:\tB\a\2\2=\a,\0064\a\5\0005\b;\0>\b\1\a5\b<\0>\b\2\a5\b=\0>\b\3\a5\b>\0>\b\4\a=\a?\6B\4\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\5\n<C-f>\0\n<C-d>\0\n<Tab>\0\t<CR>\0\14<C-Space>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\fluasnip\bcmp\16code_action\15<leader>ca\vrename\15<leader>rn\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\1\0\1\17capabilities\0\18rust_analyzer\1\0\1\17capabilities\0\rtsserver\1\0\1\17capabilities\0\fpyright\17capabilities\1\0\1\17capabilities\0\vlua_ls\14lspconfig\25default_capabilities\17cmp_nvim_lsp\21ensure_installed\1\0\1\21ensure_installed\0\1\5\0\0\vlua_ls\fpyright\rtsserver\18rust_analyzer\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n†\1\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\1K\0\1\0\28<cmd>NvimTreeToggle<cr>\14<leader>e\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nŽ\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\14highlight\0\vindent\0\21ensure_installed\0\1\r\0\0\blua\vpython\15javascript\15typescript\trust\ago\bcpp\tjson\tyaml\rmarkdown\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n“\2\0\0\6\0\r\0\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0'\5\b\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\t\0'\5\n\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\v\0'\5\f\0B\1\4\1K\0\1\0\31<cmd>Telescope buffers<cr>\15<leader>fb!<cmd>Telescope live_grep<cr>\15<leader>fg\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\bset\vkeymap\bvim\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/charan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nŽ\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\14highlight\0\vindent\0\21ensure_installed\0\1\r\0\0\blua\vpython\15javascript\15typescript\trust\ago\bcpp\tjson\tyaml\rmarkdown\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n†\1\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0B\0\4\1K\0\1\0\28<cmd>NvimTreeToggle<cr>\14<leader>e\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3À\tbody\15lsp_expandš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\2À\3À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible£\n\1\0\14\0@\0œ\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0016\0\0\0'\2\a\0B\0\2\0029\0\b\0B\0\1\0026\1\0\0'\3\t\0B\1\2\0029\2\n\0019\2\2\0025\4\v\0=\0\f\4B\2\2\0019\2\r\0019\2\2\0025\4\14\0=\0\f\4B\2\2\0019\2\15\0019\2\2\0025\4\16\0=\0\f\4B\2\2\0019\2\17\0019\2\2\0025\4\18\0=\0\f\4B\2\2\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\23\0006\6\19\0009\6\24\0069\6\25\0069\6\26\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\27\0006\6\19\0009\6\24\0069\6\25\0069\6\28\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\29\0006\6\19\0009\6\24\0069\6\25\0069\6\30\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5\31\0006\6\19\0009\6\24\0069\6\25\0069\6 \6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5!\0006\6\19\0009\6\24\0069\6\25\0069\6\"\6B\2\4\0016\2\19\0009\2\20\0029\2\21\2'\4\22\0'\5#\0006\6\19\0009\6\24\0069\6\25\0069\6$\6B\2\4\0016\2\0\0'\4%\0B\2\2\0026\3\0\0'\5&\0B\3\2\0029\4\2\0025\6*\0005\a(\0003\b'\0=\b)\a=\a+\0069\a,\0029\a-\a9\a.\a5\t0\0009\n,\0029\n/\n)\füÿB\n\2\2=\n1\t9\n,\0029\n/\n)\f\4\0B\n\2\2=\n2\t9\n,\0029\n3\nB\n\1\2=\n4\t9\n,\0029\n5\n5\f6\0B\n\2\2=\n7\t9\n,\0023\f8\0005\r9\0B\n\3\2=\n:\tB\a\2\2=\a,\0064\a\5\0005\b;\0>\b\1\a5\b<\0>\b\2\a5\b=\0>\b\3\a5\b>\0>\b\4\a=\a?\6B\4\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\5\n<C-f>\0\n<C-d>\0\n<Tab>\0\t<CR>\0\14<C-Space>\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\fluasnip\bcmp\16code_action\15<leader>ca\vrename\15<leader>rn\19implementation\agi\nhover\6K\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\bvim\1\0\1\17capabilities\0\18rust_analyzer\1\0\1\17capabilities\0\rtsserver\1\0\1\17capabilities\0\fpyright\17capabilities\1\0\1\17capabilities\0\vlua_ls\14lspconfig\25default_capabilities\17cmp_nvim_lsp\21ensure_installed\1\0\1\21ensure_installed\0\1\5\0\0\vlua_ls\fpyright\rtsserver\18rust_analyzer\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n—\2\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\1\0B\0\2\1K\0\1\0\16colorscheme\bcmd\bvim\17dim_inactive\1\0\3\nshade\tdark\fenabled\1\15percentage\4³æÌ™\3³æŒþ\3\15background\1\0\1\tdark\nmocha\1\0\5\17dim_inactive\0\fflavour\nmocha\16term_colors\2\15background\0\27transparent_background\1\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n“\2\0\0\6\0\r\0\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0'\5\b\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\t\0'\5\n\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\v\0'\5\f\0B\1\4\1K\0\1\0\31<cmd>Telescope buffers<cr>\15<leader>fb!<cmd>Telescope live_grep<cr>\15<leader>fg\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\bset\vkeymap\bvim\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
