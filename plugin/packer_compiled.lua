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
local package_path_str = "/home/e/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/e/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/e/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/e/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/e/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
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
  ["debugprint.nvim"] = {
    config = { "\27LJ\2\nü\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\topts\rcommands\1\0\3\31reset_debug_prints_counter\28ResetDebugPrintsCounter toggle_comment_debug_prints\29ToggleCommentDebugPrints\24delete_debug_prints\22DeleteDebugPrints\fkeymaps\1\0\2\fkeymaps\0\rcommands\0\vvisual\1\0\1\vvisual\0\1\0\2\19variable_below\bg?v\19variable_above\bg?V\1\2\1\0\"andrewferrier/debugprint.nvim\topts\0\nsetup\15debugprint\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/debugprint.nvim",
    url = "https://github.com/andrewferrier/debugprint.nvim"
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
  ["mini.nvim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.mini\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["noirblaze-vim"] = {
    config = { "\27LJ\2\nÍ\4\0\0\5\0\24\0H6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\b\0005\4\t\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\n\0005\4\v\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\f\0005\4\r\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\14\0005\4\15\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\16\0005\4\17\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\18\0005\4\19\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\20\0005\4\21\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\b\0005\4\22\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\n\0005\4\23\0B\0\4\1K\0\1\0\1\0\1\afg\f#c18fbe\1\0\1\afg\f#c18fbe\1\0\1\afg\f#4aa8bd\vString\1\0\3\tbold\2\afg\f#c93c96\abg\f#1a1b26\17CursorLineNr\1\0\1\abg\f#1a1b26\15SignColumn\1\0\2\afg\f#a3a19e\abg\f#1a1b26\vLineNr\1\0\2\afg\f#a3a19e\abg\f#1a1b26\vNormal\1\0\1\afg\f#c18fbe\14Statement\1\0\1\afg\f#c18fbe\fKeyword\16nvim_set_hl\bapi\26colorscheme noirblaze\bcmd\tdark\15background\bopt\bvim\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/noirblaze-vim",
    url = "https://github.com/n1ghtmare/noirblaze-vim"
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
  ["smear-cursor.nvim"] = {
    config = { "\27LJ\2\nŠ\3\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\r\23trailing_stiffness\4³æÌ™\3³æÌþ\3\14stiffness\3\1\"transparent_bg_fallback_color\f#c3c7d4%legacy_computing_symbols_support\1!smear_between_neighbor_lines\2\26smear_between_buffers\2\14normal_bg\f#1e1e2e\17cursor_color\f#c3c7d4\ngamma\3\1\21hide_target_hack\1\28distance_stop_animating\4š³æÌ\t™³¦ÿ\3#trailing_stiffness_insert_mode\3\1\22trailing_exponent\4Í™³æ\fÌ™³ÿ\3\nsetup\17smear_cursor\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/smear-cursor.nvim",
    url = "https://github.com/sphamba/smear-cursor.nvim"
  },
  ["snipe.nvim"] = {
    config = { "\27LJ\2\nƒ\4\0\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\f\0009\1\r\0019\1\14\1'\3\15\0'\4\16\0009\5\17\0B\1\4\1K\0\1\0\21open_buffer_menu\6t\6n\bset\vkeymap\bvim\rnavigate\1\0\b\15open_split\6H\14prev_page\6K\16open_vsplit\6V\14next_page\6J\17close_buffer\6D\17cancel_snipe\n<esc>\15change_tag\6C\17under_cursor\t<cr>\nhints\1\0\1\15dictionary\0151234567890\aui\1\0\4\nhints\0\rnavigate\0\tsort\fdefault\aui\0\22open_win_override\1\0\2\ntitle\5\vborder\frounded\1\0\6\15text_align\tleft\22open_win_override\0\rposition\ftopleft\15max_height\3ÿÿÿÿ\15\14preselect\0\22preselect_current\1\nsetup\nsnipe\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/snipe.nvim",
    url = "https://github.com/leath-dub/snipe.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["ultimate-autopair.nvim"] = {
    config = { "\27LJ\2\nM\0\0\2\0\5\0\v6\0\0\0009\0\1\0009\0\2\0\6\0\3\0X\1\4€\6\0\4\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\tjson\thttp\rfiletype\abo\bvim`\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\fenabled\1\0\1\fenabled\0\0\nsetup\22ultimate-autopair\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/ultimate-autopair.nvim",
    url = "https://github.com/altermo/ultimate-autopair.nvim"
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
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.mini\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: debugprint.nvim
time([[Config for debugprint.nvim]], true)
try_loadstring("\27LJ\2\nü\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\topts\rcommands\1\0\3\31reset_debug_prints_counter\28ResetDebugPrintsCounter toggle_comment_debug_prints\29ToggleCommentDebugPrints\24delete_debug_prints\22DeleteDebugPrints\fkeymaps\1\0\2\fkeymaps\0\rcommands\0\vvisual\1\0\1\vvisual\0\1\0\2\19variable_below\bg?v\19variable_above\bg?V\1\2\1\0\"andrewferrier/debugprint.nvim\topts\0\nsetup\15debugprint\frequire\0", "config", "debugprint.nvim")
time([[Config for debugprint.nvim]], false)
-- Config for: smear-cursor.nvim
time([[Config for smear-cursor.nvim]], true)
try_loadstring("\27LJ\2\nŠ\3\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\r\23trailing_stiffness\4³æÌ™\3³æÌþ\3\14stiffness\3\1\"transparent_bg_fallback_color\f#c3c7d4%legacy_computing_symbols_support\1!smear_between_neighbor_lines\2\26smear_between_buffers\2\14normal_bg\f#1e1e2e\17cursor_color\f#c3c7d4\ngamma\3\1\21hide_target_hack\1\28distance_stop_animating\4š³æÌ\t™³¦ÿ\3#trailing_stiffness_insert_mode\3\1\22trailing_exponent\4Í™³æ\fÌ™³ÿ\3\nsetup\17smear_cursor\frequire\0", "config", "smear-cursor.nvim")
time([[Config for smear-cursor.nvim]], false)
-- Config for: kulala.nvim
time([[Config for kulala.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.kulala\frequire\0", "config", "kulala.nvim")
time([[Config for kulala.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.gitconflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: snipe.nvim
time([[Config for snipe.nvim]], true)
try_loadstring("\27LJ\2\nƒ\4\0\0\6\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\f\0009\1\r\0019\1\14\1'\3\15\0'\4\16\0009\5\17\0B\1\4\1K\0\1\0\21open_buffer_menu\6t\6n\bset\vkeymap\bvim\rnavigate\1\0\b\15open_split\6H\14prev_page\6K\16open_vsplit\6V\14next_page\6J\17close_buffer\6D\17cancel_snipe\n<esc>\15change_tag\6C\17under_cursor\t<cr>\nhints\1\0\1\15dictionary\0151234567890\aui\1\0\4\nhints\0\rnavigate\0\tsort\fdefault\aui\0\22open_win_override\1\0\2\ntitle\5\vborder\frounded\1\0\6\15text_align\tleft\22open_win_override\0\rposition\ftopleft\15max_height\3ÿÿÿÿ\15\14preselect\0\22preselect_current\1\nsetup\nsnipe\frequire\0", "config", "snipe.nvim")
time([[Config for snipe.nvim]], false)
-- Config for: noirblaze-vim
time([[Config for noirblaze-vim]], true)
try_loadstring("\27LJ\2\nÍ\4\0\0\5\0\24\0H6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\b\0005\4\t\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\n\0005\4\v\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\f\0005\4\r\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\14\0005\4\15\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\16\0005\4\17\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\18\0005\4\19\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\20\0005\4\21\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\b\0005\4\22\0B\0\4\0016\0\0\0009\0\6\0009\0\a\0)\2\0\0'\3\n\0005\4\23\0B\0\4\1K\0\1\0\1\0\1\afg\f#c18fbe\1\0\1\afg\f#c18fbe\1\0\1\afg\f#4aa8bd\vString\1\0\3\tbold\2\afg\f#c93c96\abg\f#1a1b26\17CursorLineNr\1\0\1\abg\f#1a1b26\15SignColumn\1\0\2\afg\f#a3a19e\abg\f#1a1b26\vLineNr\1\0\2\afg\f#a3a19e\abg\f#1a1b26\vNormal\1\0\1\afg\f#c18fbe\14Statement\1\0\1\afg\f#c18fbe\fKeyword\16nvim_set_hl\bapi\26colorscheme noirblaze\bcmd\tdark\15background\bopt\bvim\0", "config", "noirblaze-vim")
time([[Config for noirblaze-vim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.wilder\frequire\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.conform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: pounce.nvim
time([[Config for pounce.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.pounce\frequire\0", "config", "pounce.nvim")
time([[Config for pounce.nvim]], false)
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
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'ultimate-autopair.nvim', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
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
