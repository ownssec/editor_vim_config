" -------- options ------------
set number
set relativenumber
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set history=5000
set clipboard=unnamedplus
set scl=no
set modifiable
set hlsearch
set showtabline=0
set modifiable
set nohlsearch
set incsearch
set encoding=utf-8
" -------- end options ------------

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" In your init.lua or init.vim
" for bufferline plugin
set termguicolors

set hidden
set ignorecase
set smartcase

set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ' '


call plug#begin()
" call plug#begin('~/.config/nvim')

    Plug 'numToStr/Comment.nvim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-tree/nvim-web-devicons' " optional

    Plug 'nvim-lualine/lualine.nvim'

    Plug 'nvim-tree/nvim-tree.lua'

    " Plug 'jiangmiao/auto-pairs'

    Plug 'nvim-lua/plenary.nvim'

    Plug 'lewis6991/gitsigns.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'folke/tokyonight.nvim'

    Plug 'neovim/nvim-lspconfig'
    Plug 'rafamadriz/friendly-snippets'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'


    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    " Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'stevearc/conform.nvim'


    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }


    Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
    Plug 'ryanoasis/vim-devicons' 


    " for git fixing encoding codeto codebase
    Plug 'sindrets/diffview.nvim'


    Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

    Plug 'windwp/nvim-autopairs'

call plug#end()




lua << EOF
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night",
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true,
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },

  sidebars = {"qf", "help"},
  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme



  on_colors = function(colors)
        colors.bg = "#1f1f1f"
        -- colors.bg_dark = "#1f1f1f"
        -- colors.terminal_black = "#1E1E1E"
        -- colors.fg = "#ffffff"
        -- colors.bg = "#000000"
        -- colors.bg_dark = "#000000"
        -- colors.terminal_black = "#000000"
        colors.hint = colors.orange
        colors.error = colors.red
        colors.warning= colors.red
        colors.info= colors.red

        colors.info= colors.red

        colors.bg_sidebar = "#1f1f1f"
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
  end,

})
vim.cmd("colorscheme tokyonight-night")

-- local util = require("tokyonight.util").setup({})

-- util.night.bg = '#ffffff'


EOF


nnoremap <c-z> :u<CR>
inoremap <c-z> <c-o>:u<CR>

:lua require("toggleterm").setup()


autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-1> <Cmd>exe  "ToggleTerm 1"<CR>
nnoremap <silent><A-1> <Cmd>exe  "ToggleTerm 1"<CR>
inoremap <silent><A-1> <Esc><Cmd>exe  "ToggleTerm 1"<CR>

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-2> <Cmd>exe  "ToggleTerm 2"<CR>
nnoremap <silent><A-2> <Cmd>exe  "ToggleTerm 2"<CR>
inoremap <silent><A-2> <Esc><Cmd>exe  "ToggleTerm 2"<CR>

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-3> <Cmd>exe  "ToggleTerm 3"<CR>
nnoremap <silent><A-3> <Cmd>exe  "ToggleTerm 3"<CR>
inoremap <silent><A-3> <Esc><Cmd>exe  "ToggleTerm 3"<CR>


autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-4> <Cmd>exe  "ToggleTerm 4"<CR>
nnoremap <silent><A-4> <Cmd>exe  "ToggleTerm 4"<CR>
inoremap <silent><A-4> <Esc><Cmd>exe  "ToggleTerm 4"<CR>


:lua require("toggleterm").setup()

lua << EOF
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

EOF

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

:lua require("Comment").setup()

lua << EOF

-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#3c3c3c',
  --black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black},
    b = { fg = colors.white, bg = colors.black},
    c = { fg = colors.white, bg = colors.black },
  },

  insert = { a = { fg = colors.white, bg = colors.black} },
  visual = { a = { fg = colors.white, bg = colors.black} },
  terminal = { a = { fg = colors.white, bg = colors.black} },
  command = { a = { fg = colors.white, bg = colors.black} },
  replace = { a = { fg = colors.white, bg = colors.black} },

 -- insert = { a = { fg = colors.white, bg = colors.black} },
 --  visual = { a = { fg = colors.violet, bg = colors.black} },
 --  terminal = { a = { fg = colors.cyan, bg = colors.black} },
 --  command = { a = { fg = colors.blue, bg = colors.black} },
 --  replace = { a = { fg = colors.blue, bg = colors.black} },


  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup({
  options = {
    icons_enabled = false,
    -- theme = 'tokyonight',
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '|', right = '|' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '|' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
   -- disabled_filetypes = {  'NVimTree' },
  tabline = {},
  extensions = {},
})

EOF


lua << EOF
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- disable netrw at the very start of your init.lua
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

 -- custom mappings
  vim.keymap.set('n', '<C-e>', api.tree.toggle,        opts('Up'))
  vim.keymap.set('n', 'f', api.tree.toggle_help,        opts('Up'))
  -- vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))

end


-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
view = {
    width = 30,
    number = true
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  ---
}

EOF

nnoremap <silent><C-e> :NvimTreeToggle<CR>
inoremap <silent><C-e> :NvimTreeToggle<CR>

lua << EOF
require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    -- map('n', '<leader>hs', gs.stage_hunk)
    -- map('n', '<leader>hr', gs.reset_hunk)
    -- map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('n', '<leader>hS', gs.stage_buffer)
    -- map('n', '<leader>hu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end

}

EOF




" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- parser_install_dir = "~/config/nvim/nvim-treesitter/parsers",

  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "c",
    "html",
    "css",
    "javascript",
    "json",
    "php",
    "scss",
    "slint",
    "sql",
    "tsx",
    "typescript",
    "python",
     "bash",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "regex",
    "typescript",
    "vim",
    "yaml",
    "vue"},


  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  --ignore_install = { "" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {  "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },


}
EOF


" LSP setup
lua << EOF

-- require'lspconfig'.pyright.setup{}
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
require('lspconfig').tsserver.setup({
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
})
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}

dependencies = {
  "jose-elias-alvarez/typescript.nvim",
  init = function()
    require("lazyvim.util").on_attach(function(_, buffer)
      -- stylua: ignore
      vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
      vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
    end)
  end,
}
---@class PluginLspOpts
opts = {
  ---@type lspconfig.options
  servers = {
    -- tsserver will be automatically installed with mason and loaded with lspconfig
    tsserver = {},
  },
  -- you can do any additional lsp server setup here
  -- return true if you don't want this server to be setup with lspconfig
  ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
  setup = {
    -- example to setup with typescript.nvim
    tsserver = function(_, opts)
      require("typescript").setup({ server = opts })
      return true
    end,
    -- Specify * to use this function as a fallback for any server
    -- ["*"] = function(server, opts) end,
  },
}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF

lua <<EOF
-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
-- -- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- lspconfig.tailwindcss.setup({ 
--  capabilities = capabilities
-- })
lspconfig.tsserver.setup({ 
 capabilities = capabilities
})
lspconfig.cssls.setup({
 capabilities = capabilities
})
lspconfig.clangd.setup({
 capabilities = capabilities
})

lspconfig.cssls.setup({
capabilities = capabilities
})

lspconfig.sqlls.setup({
capabilities = capabilities
})

lspconfig.html.setup({
capabilities = capabilities
})

lspconfig.intelephense.setup({
capabilities = capabilities
})
-- lspconfig.stimulus_ls.setup({
-- capabilities = capabilities
-- })
lspconfig.phpactor.setup({
capabilities = capabilities
})
lspconfig.phan.setup({
capabilities = capabilities
})

-- lspconfig.svelte.setup({
-- capabilities = capabilities
-- })

-- luasnip setup
local luasnip = require 'luasnip'
  -- Set up nvim-cmp.

 local cmp = require'cmp'
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly

    }),
    -- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
    sources = cmp.config.sources({
     {name = 'path'},
      {name = 'nvim_lsp', keyword_length = 1},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
     -- { name = 'cmp_nvim_lsp' },
      -- { name = 'luasnip' , option = { use_show_condition = false, show_autosnippets=false} }, -- For luasnip users.
       { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })

  })
    -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' }
    })
  })

EOF


lua << EOF
require("mason").setup({})
require('mason-lspconfig').setup()
EOF



lua << EOF
require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
EOF


lua << EOF
require("telescope").setup{ 
  defaults = {
    -- These options will be passed to conform.format()
    file_ignore_patterns = { "./node_modules/*", "node_modules", "build/*"},
    layout_config = {
      vertical = { width = 0.5 }
    },
  }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<S-p>', builtin.find_files, {})
vim.keymap.set('n', '<S-o>', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

EOF



" telescope: require("telescope.health").check()
"
" Checking for required plugins ~
" - OK plenary installed.
" - OK nvim-treesitter installed.
"
" Checking external dependencies ~
" - OK rg: found ripgrep 13.0.0
" - OK fd: found fd 8.7.0
"
" ===== Installed extensions ===== ~

" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>


" options
set cursorline
" hi CursorLineNr guifg=#e6e3e3
hi CursorLineNr guifg=#ffffff
:lua vim.api.nvim_set_hl(0, 'LineNr', { fg = "#646d5f"})
" end options


lua << EOF
-- vim.opt.termguicolors = true
-- style here just type below
-- :h bufflerline-styling
local bufferline = require('bufferline')
    bufferline.setup({
        options = {
            indicator = {
                icon = '*', -- this should be omitted if indicator style is not 'icon'
            },
            show_buffer_icons = false,
            show_duplicate_prefix = false,
            style_preset = bufferline.style_preset.no_italic,
            -- or you can combine these e.g.
            style_preset = {
                bufferline.style_preset.no_italic,
                bufferline.style_preset.no_bold
            },
            enforce_regular_tabs = true,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                if context.buffer:current() then
                        return ''
                    end
                    return ''
            end,
            offsets = {
                  {
                      filetype = "NvimTree",
                      text = "",
                      -- text = function()
                      --   return vim.fn.getcwd()
                      -- end,
                      highlight = "Directory",
                      -- separator = true, -- use a "true" to enable the default, or set your own character
                      -- text_align = "left"
                  }
            },
          }
     })


EOF

" bufferline next and prev keymaps
nnoremap <silent>t] :BufferLineCycleNext<CR>
nnoremap <silent>t[ :BufferLineCyclePrev<CR>

lua << EOF
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  disable_in_macro = false
})
EOF
