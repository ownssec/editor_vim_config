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
local package_path_str = "/home/e/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/home/e/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/home/e/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/home/e/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/e/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fluasnip\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/e/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/e/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.conform\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.gitconflict\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["kulala.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.kulala\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/kulala.nvim",
    url = "https://github.com/mistweaverco/kulala.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.lualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-path" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.cmpconf\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvimtree\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/nvim-yarp",
    url = "https://github.com/roxma/nvim-yarp"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pounce.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.pounce\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/pounce.nvim",
    url = "https://github.com/rlane/pounce.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.theme\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trailblazer.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.trails\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/trailblazer.nvim",
    url = "https://github.com/LeonHeidelbach/trailblazer.nvim"
  },
  ["ultimate-autopair.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\22ultimate-autopair\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/ultimate-autopair.nvim",
    url = "https://github.com/altermo/ultimate-autopair.nvim"
  },
  ["vim-grepper"] = {
    config = { "\27LJ\2\nƒ\1\0\0\4\0\b\0\0186\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0029\1\4\0)\2\0\0\1\2\1\0X\1\b€9\1\5\0)\2\1\0\1\2\1\0X\1\4€6\1\0\0009\1\6\1'\3\a\0B\1\2\1K\0\1\0\ncprev\bcmd\bidx\tsize\1\0\2\tsize\3\0\bidx\3\0\14getqflist\afn\bvimƒ\1\0\0\4\0\b\0\0186\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0029\1\4\0)\2\0\0\1\2\1\0X\1\b€9\1\5\0009\2\4\0\1\1\2\0X\1\4€6\1\0\0009\1\6\1'\3\a\0B\1\2\1K\0\1\0\ncnext\bcmd\bidx\tsize\1\0\2\tsize\3\0\bidx\3\0\14getqflist\afn\bvimE\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0\15nohlsearch\vcclose\bcmd\bvim—\2\0\0\v\0\f\0(+\0\1\0006\1\0\0006\3\1\0009\3\2\0039\3\3\3B\3\1\0A\1\0\4X\4\14€6\6\1\0009\6\2\0069\6\4\0066\b\1\0009\b\2\b9\b\5\b\18\n\5\0B\b\2\2'\t\6\0B\6\3\2\a\6\a\0X\6\2€+\0\2\0X\1\2€E\4\3\3R\4ð\127\15\0\0\0X\1\t€6\1\1\0009\1\b\1'\3\t\0B\1\2\0016\1\1\0009\1\b\1'\3\n\0B\1\2\1X\1\4€6\1\1\0009\1\b\1'\3\v\0B\1\2\1K\0\1\0\ncopen\15nohlsearch\vcclose\bcmd\rquickfix\fbuftype\21nvim_win_get_buf\24nvim_buf_get_option\19nvim_list_wins\bapi\bvim\vipairsÕ\3\1\0\6\0\25\00006\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0003\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\15\0003\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\18\0009\0\19\0'\2\20\0003\3\21\0004\4\0\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\22\0003\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\1\tdesc4Toggle Quickfix List and Clear Search Highlight\0\a[s\0\vCclose\29nvim_create_user_command\bapi\1\0\2\vsilent\2\fnoremap\2\0\n<C-n>\1\0\2\vsilent\2\fnoremap\2\0\n<C-p>\1\0\2\vsilent\2\fnoremap\2\28:Grepper -highlight<CR>\n<C-o>\6n\bset\vkeymap\16%f:%l:%c:%m\15grepformat\21rg --vimgrep -uu\fgrepprg\bopt\bvim\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/vim-grepper",
    url = "https://github.com/mhinz/vim-grepper"
  },
  ["vim-hug-neovim-rpc"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/vim-hug-neovim-rpc",
    url = "https://github.com/roxma/vim-hug-neovim-rpc"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.wilder\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: pounce.nvim
time([[Config for pounce.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.pounce\frequire\0", "config", "pounce.nvim")
time([[Config for pounce.nvim]], false)
-- Config for: vim-grepper
time([[Config for vim-grepper]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\4\0\b\0\0186\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0029\1\4\0)\2\0\0\1\2\1\0X\1\b€9\1\5\0)\2\1\0\1\2\1\0X\1\4€6\1\0\0009\1\6\1'\3\a\0B\1\2\1K\0\1\0\ncprev\bcmd\bidx\tsize\1\0\2\tsize\3\0\bidx\3\0\14getqflist\afn\bvimƒ\1\0\0\4\0\b\0\0186\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0029\1\4\0)\2\0\0\1\2\1\0X\1\b€9\1\5\0009\2\4\0\1\1\2\0X\1\4€6\1\0\0009\1\6\1'\3\a\0B\1\2\1K\0\1\0\ncnext\bcmd\bidx\tsize\1\0\2\tsize\3\0\bidx\3\0\14getqflist\afn\bvimE\0\0\3\0\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\1K\0\1\0\15nohlsearch\vcclose\bcmd\bvim—\2\0\0\v\0\f\0(+\0\1\0006\1\0\0006\3\1\0009\3\2\0039\3\3\3B\3\1\0A\1\0\4X\4\14€6\6\1\0009\6\2\0069\6\4\0066\b\1\0009\b\2\b9\b\5\b\18\n\5\0B\b\2\2'\t\6\0B\6\3\2\a\6\a\0X\6\2€+\0\2\0X\1\2€E\4\3\3R\4ð\127\15\0\0\0X\1\t€6\1\1\0009\1\b\1'\3\t\0B\1\2\0016\1\1\0009\1\b\1'\3\n\0B\1\2\1X\1\4€6\1\1\0009\1\b\1'\3\v\0B\1\2\1K\0\1\0\ncopen\15nohlsearch\vcclose\bcmd\rquickfix\fbuftype\21nvim_win_get_buf\24nvim_buf_get_option\19nvim_list_wins\bapi\bvim\vipairsÕ\3\1\0\6\0\25\00006\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0003\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\15\0003\4\16\0005\5\17\0B\0\5\0016\0\0\0009\0\18\0009\0\19\0'\2\20\0003\3\21\0004\4\0\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\22\0003\4\23\0005\5\24\0B\0\5\1K\0\1\0\1\0\1\tdesc4Toggle Quickfix List and Clear Search Highlight\0\a[s\0\vCclose\29nvim_create_user_command\bapi\1\0\2\vsilent\2\fnoremap\2\0\n<C-n>\1\0\2\vsilent\2\fnoremap\2\0\n<C-p>\1\0\2\vsilent\2\fnoremap\2\28:Grepper -highlight<CR>\n<C-o>\6n\bset\vkeymap\16%f:%l:%c:%m\15grepformat\21rg --vimgrep -uu\fgrepprg\bopt\bvim\0", "config", "vim-grepper")
time([[Config for vim-grepper]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: kulala.nvim
time([[Config for kulala.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.kulala\frequire\0", "config", "kulala.nvim")
time([[Config for kulala.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.wilder\frequire\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.conform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: trailblazer.nvim
time([[Config for trailblazer.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.trails\frequire\0", "config", "trailblazer.nvim")
time([[Config for trailblazer.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.theme\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.gitconflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd nvim-tree.lua ]]

-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvimtree\frequire\0", "config", "nvim-tree.lua")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'ultimate-autopair.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'lualine.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'ultimate-autopair.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

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
