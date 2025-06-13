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
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.bufferline\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
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
  ["cmp-fuzzy-buffer"] = {
    after_files = { "/home/e/.local/share/nvim/site/pack/packer/opt/cmp-fuzzy-buffer/after/plugin/cmp_fuzzy_buffer.lua" },
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21cmp_fuzzy_buffer\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/cmp-fuzzy-buffer",
    url = "https://github.com/tzachar/cmp-fuzzy-buffer"
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
    config = { "\27LJ\2\nü\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\topts\rcommands\1\0\3 toggle_comment_debug_prints\29ToggleCommentDebugPrints\31reset_debug_prints_counter\28ResetDebugPrintsCounter\24delete_debug_prints\22DeleteDebugPrints\fkeymaps\1\0\2\fkeymaps\0\rcommands\0\vvisual\1\0\1\vvisual\0\1\0\2\19variable_above\bg?V\19variable_below\bg?v\1\2\1\0\"andrewferrier/debugprint.nvim\topts\0\nsetup\15debugprint\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/debugprint.nvim",
    url = "https://github.com/andrewferrier/debugprint.nvim"
  },
  ["fuzzy.nvim"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/fuzzy.nvim",
    url = "https://github.com/tzachar/fuzzy.nvim"
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
  ["leap.nvim"] = {
    config = { "\27LJ\2\nƒ\1\0\0\6\1\6\1\f-\0\0\0009\0\0\0005\2\4\0004\3\3\0006\4\1\0009\4\2\0049\4\3\4B\4\1\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\0À\19target_windows\1\0\1\19target_windows\0\25nvim_get_current_win\bapi\bvim\tleap\3€€À™\4í\1\1\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0+\3\1\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1)\3\0\0'\4\6\0005\5\a\0B\1\4\0016\1\3\0009\1\b\0019\1\t\0015\3\n\0'\4\v\0003\5\f\0005\6\r\0B\1\5\0012\0\0€K\0\1\0\1\0\1\tdesc\28Leap forward (custom f)\0\6f\1\4\0\0\6n\6x\6o\bset\vkeymap\1\0\1\tlink\fComment\17LeapBackdrop\16nvim_set_hl\bapi\bvim\24set_default_keymaps\tleap\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
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
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
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
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-fuzzy-buffer", "cmp-path" },
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
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nŒ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\14filetypes\1\0\1\14filetypes\0\1\a\0\0\thtml\15javascript\bjsx\15typescript\btsx\bphp\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/e/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
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
  ["smear-cursor.nvim"] = {
    config = { "\27LJ\2\nÁ\3\0\0\3\0\a\0\v6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\15!smear_between_neighbor_lines\2\26smear_between_buffers\2\27never_draw_over_target\2\22trailing_exponent\3\6\28distance_stop_animating\4Í™³æ\fÌ™³ÿ\3#trailing_stiffness_insert_mode\4æÌ™³\6æÌ™ÿ\3\18time_interval\3\b\26stiffness_insert_mode\4æÌ™³\6æÌ™ÿ\3\23trailing_stiffness\4³æÌ™\3³æŒÿ\3\14stiffness\4Í™³æ\fÌ™³ÿ\3\nspeed\3\n\17cursor_color\f#ededed\ngamma\3\1\21hide_target_hack\2\22smear_insert_mode\2\nsetup\17smear_cursor\frequire\18termguicolors\6o\bvim\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/smear-cursor.nvim",
    url = "https://github.com/sphamba/smear-cursor.nvim"
  },
  ["statuscol.nvim"] = {
    config = { "\27LJ\2\ní\1\0\0\6\0\f\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\4\0005\4\5\0005\5\4\0=\5\6\4>\4\1\0035\4\b\0005\5\a\0=\5\6\4>\4\2\0035\4\n\0005\5\t\0=\5\6\4>\4\3\3=\3\v\2B\0\2\1K\0\1\0\rsegments\1\0\1\ttext\0\1\2\0\0\a  \1\0\2\nclick\15v:lua.ScLa\ttext\0\1\2\0\0\a%l\ttext\1\0\2\nclick\15v:lua.ScSa\ttext\0\1\2\0\0\a%s\1\0\2\rsegments\0\16relculright\2\nsetup\14statuscol\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/statuscol.nvim",
    url = "https://github.com/luukvbaal/statuscol.nvim"
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
  ["vague.nvim"] = {
    config = { "\27LJ\2\n\v\0\2\2\0\0\0\1K\0\1\0©\t\1\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0023\3\18\0=\3\19\0025\3\20\0=\3\21\2B\0\2\1K\0\1\0\vcolors\1\0\22\16floatBorder\f#878787\thint\f#7e98e8\afg\f#cdcdcd\fwarning\f#f3be7c\abg\f#141415\vstring\f#e8b589\vvisual\f#333738\rproperty\f#c3c3d5\14parameter\f#bb9dbd\fkeyword\f#6e94b2\rconstant\f#aeaed1\ttype\f#9bb4bc\vnumber\f#e0a363\fbuiltin\f#b4d4cf\fcomment\f#606079\roperator\f#90a0b5\ndelta\f#f3be7c\tfunc\f#c48282\tplus\f#7fa563\vsearch\f#405065\nerror\f#d8647e\tline\f#252530\18on_highlights\0\fplugins\14telescope\1\0\1\nmatch\tbold\fneotest\1\0\2\ffocused\tbold\17adapter_name\tbold\blsp\1\0\5\21diagnostic_error\tbold\20diagnostic_warn\tbold\18diagnostic_ok\tnone\20diagnostic_info\vitalic\20diagnostic_hint\tnone\14dashboard\1\0\1\vfooter\vitalic\bcmp\1\0\5\14telescope\0\14dashboard\0\fneotest\0\bcmp\0\blsp\0\1\0\2\16match_fuzzy\tbold\nmatch\tbold\nstyle\1\0\20\14operators\tnone\rheadings\tbold\14functions\tnone\17conditionals\tnone\rcomments\vitalic\19keyword_return\vitalic\22builtin_variables\tnone\nfloat\tnone\vnumber\tnone\fboolean\tbold\18builtin_types\tbold\22builtin_functions\tnone\22builtin_constants\tbold\23keywords_exception\tnone\19keywords_label\tnone\18keywords_loop\tnone\nerror\tbold\rkeywords\tnone\14variables\tnone\fstrings\vitalic\1\0\a\tbold\2\16transparent\1\18on_highlights\0\fplugins\0\vcolors\0\nstyle\0\vitalic\2\nsetup\nvague\frequire\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/vague.nvim",
    url = "https://github.com/vague2k/vague.nvim"
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
  },
  ["zenbones.nvim"] = {
    config = { "\27LJ\2\nÿ\3\0\0\6\0\24\0?'\0\0\0006\1\1\0009\1\2\1'\2\4\0=\2\3\0016\1\1\0009\1\5\1'\3\6\0B\1\2\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0005\5\n\0B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\v\0005\5\f\0B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\r\0005\5\14\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\16\0005\5\17\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\18\0005\5\19\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\20\0005\5\21\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\22\0005\5\23\0B\1\4\1K\0\1\0\1\0\1\afg\f#4aa8bd\vString\1\0\3\abg\0\tbold\2\afg\f#dedede\17CursorLineNr\1\0\1\abg\0\15SignColumn\1\0\2\abg\0\afg\f#a3a19e\vLineNr\abg\1\0\2\abg\0\afg\f#a3a19e\vNormal\1\0\1\afg\f#c18fbe\14Statement\1\0\2\afg\f#c18fbe\tbold\2\fKeyword\16nvim_set_hl\bapi\25colorscheme neobones\bcmd\tdark\15background\6o\bvim\f#1e1e1e\0" },
    loaded = true,
    path = "/home/e/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/zenbones-theme/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: vague.nvim
time([[Config for vague.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\2\2\0\0\0\1K\0\1\0©\t\1\0\5\0\22\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0023\3\18\0=\3\19\0025\3\20\0=\3\21\2B\0\2\1K\0\1\0\vcolors\1\0\22\16floatBorder\f#878787\thint\f#7e98e8\afg\f#cdcdcd\fwarning\f#f3be7c\abg\f#141415\vstring\f#e8b589\vvisual\f#333738\rproperty\f#c3c3d5\14parameter\f#bb9dbd\fkeyword\f#6e94b2\rconstant\f#aeaed1\ttype\f#9bb4bc\vnumber\f#e0a363\fbuiltin\f#b4d4cf\fcomment\f#606079\roperator\f#90a0b5\ndelta\f#f3be7c\tfunc\f#c48282\tplus\f#7fa563\vsearch\f#405065\nerror\f#d8647e\tline\f#252530\18on_highlights\0\fplugins\14telescope\1\0\1\nmatch\tbold\fneotest\1\0\2\ffocused\tbold\17adapter_name\tbold\blsp\1\0\5\21diagnostic_error\tbold\20diagnostic_warn\tbold\18diagnostic_ok\tnone\20diagnostic_info\vitalic\20diagnostic_hint\tnone\14dashboard\1\0\1\vfooter\vitalic\bcmp\1\0\5\14telescope\0\14dashboard\0\fneotest\0\bcmp\0\blsp\0\1\0\2\16match_fuzzy\tbold\nmatch\tbold\nstyle\1\0\20\14operators\tnone\rheadings\tbold\14functions\tnone\17conditionals\tnone\rcomments\vitalic\19keyword_return\vitalic\22builtin_variables\tnone\nfloat\tnone\vnumber\tnone\fboolean\tbold\18builtin_types\tbold\22builtin_functions\tnone\22builtin_constants\tbold\23keywords_exception\tnone\19keywords_label\tnone\18keywords_loop\tnone\nerror\tbold\rkeywords\tnone\14variables\tnone\fstrings\vitalic\1\0\a\tbold\2\16transparent\1\18on_highlights\0\fplugins\0\vcolors\0\nstyle\0\vitalic\2\nsetup\nvague\frequire\0", "config", "vague.nvim")
time([[Config for vague.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.wilder\frequire\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: kulala.nvim
time([[Config for kulala.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18config.kulala\frequire\0", "config", "kulala.nvim")
time([[Config for kulala.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: zenbones.nvim
time([[Config for zenbones.nvim]], true)
try_loadstring("\27LJ\2\nÿ\3\0\0\6\0\24\0?'\0\0\0006\1\1\0009\1\2\1'\2\4\0=\2\3\0016\1\1\0009\1\5\1'\3\6\0B\1\2\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0005\5\n\0B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\v\0005\5\f\0B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\r\0005\5\14\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\16\0005\5\17\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\18\0005\5\19\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\20\0005\5\21\0=\0\15\5B\1\4\0016\1\1\0009\1\a\0019\1\b\1)\3\0\0'\4\22\0005\5\23\0B\1\4\1K\0\1\0\1\0\1\afg\f#4aa8bd\vString\1\0\3\abg\0\tbold\2\afg\f#dedede\17CursorLineNr\1\0\1\abg\0\15SignColumn\1\0\2\abg\0\afg\f#a3a19e\vLineNr\abg\1\0\2\abg\0\afg\f#a3a19e\vNormal\1\0\1\afg\f#c18fbe\14Statement\1\0\2\afg\f#c18fbe\tbold\2\fKeyword\16nvim_set_hl\bapi\25colorscheme neobones\bcmd\tdark\15background\6o\bvim\f#1e1e1e\0", "config", "zenbones.nvim")
time([[Config for zenbones.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nƒ\1\0\0\6\1\6\1\f-\0\0\0009\0\0\0005\2\4\0004\3\3\0006\4\1\0009\4\2\0049\4\3\4B\4\1\0?\4\0\0=\3\5\2B\0\2\1K\0\1\0\0À\19target_windows\1\0\1\19target_windows\0\25nvim_get_current_win\bapi\bvim\tleap\3€€À™\4í\1\1\0\a\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\1\2\0+\3\1\0B\1\2\0016\1\3\0009\1\4\0019\1\5\1)\3\0\0'\4\6\0005\5\a\0B\1\4\0016\1\3\0009\1\b\0019\1\t\0015\3\n\0'\4\v\0003\5\f\0005\6\r\0B\1\5\0012\0\0€K\0\1\0\1\0\1\tdesc\28Leap forward (custom f)\0\6f\1\4\0\0\6n\6x\6o\bset\vkeymap\1\0\1\tlink\fComment\17LeapBackdrop\16nvim_set_hl\bapi\bvim\24set_default_keymaps\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: smear-cursor.nvim
time([[Config for smear-cursor.nvim]], true)
try_loadstring("\27LJ\2\nÁ\3\0\0\3\0\a\0\v6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0B\0\2\1K\0\1\0\1\0\15!smear_between_neighbor_lines\2\26smear_between_buffers\2\27never_draw_over_target\2\22trailing_exponent\3\6\28distance_stop_animating\4Í™³æ\fÌ™³ÿ\3#trailing_stiffness_insert_mode\4æÌ™³\6æÌ™ÿ\3\18time_interval\3\b\26stiffness_insert_mode\4æÌ™³\6æÌ™ÿ\3\23trailing_stiffness\4³æÌ™\3³æŒÿ\3\14stiffness\4Í™³æ\fÌ™³ÿ\3\nspeed\3\n\17cursor_color\f#ededed\ngamma\3\1\21hide_target_hack\2\22smear_insert_mode\2\nsetup\17smear_cursor\frequire\18termguicolors\6o\bvim\0", "config", "smear-cursor.nvim")
time([[Config for smear-cursor.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: statuscol.nvim
time([[Config for statuscol.nvim]], true)
try_loadstring("\27LJ\2\ní\1\0\0\6\0\f\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\4\0005\4\5\0005\5\4\0=\5\6\4>\4\1\0035\4\b\0005\5\a\0=\5\6\4>\4\2\0035\4\n\0005\5\t\0=\5\6\4>\4\3\3=\3\v\2B\0\2\1K\0\1\0\rsegments\1\0\1\ttext\0\1\2\0\0\a  \1\0\2\nclick\15v:lua.ScLa\ttext\0\1\2\0\0\a%l\ttext\1\0\2\nclick\15v:lua.ScSa\ttext\0\1\2\0\0\a%s\1\0\2\rsegments\0\16relculright\2\nsetup\14statuscol\frequire\0", "config", "statuscol.nvim")
time([[Config for statuscol.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19config.conform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16config.mini\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22config.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23config.gitconflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: debugprint.nvim
time([[Config for debugprint.nvim]], true)
try_loadstring("\27LJ\2\nü\2\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0005\5\4\0=\5\6\4=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\topts\rcommands\1\0\3 toggle_comment_debug_prints\29ToggleCommentDebugPrints\31reset_debug_prints_counter\28ResetDebugPrintsCounter\24delete_debug_prints\22DeleteDebugPrints\fkeymaps\1\0\2\fkeymaps\0\rcommands\0\vvisual\1\0\1\vvisual\0\1\0\2\19variable_above\bg?V\19variable_below\bg?v\1\2\1\0\"andrewferrier/debugprint.nvim\topts\0\nsetup\15debugprint\frequire\0", "config", "debugprint.nvim")
time([[Config for debugprint.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd nvim-tree.lua ]]

-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.nvimtree\frequire\0", "config", "nvim-tree.lua")

vim.cmd [[ packadd fuzzy.nvim ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'ultimate-autopair.nvim', 'nvim-autopairs', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'ultimate-autopair.nvim'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'lualine.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
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
