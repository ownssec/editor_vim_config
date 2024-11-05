"version 0.03
"nvim 0.10.0 working stable
"
" -------- options ------------
set number
set relativenumber
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set history=5000
" set clipboard=unnamedplus
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

    " follow latest release and install jsregexp.
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    Plug 'saadparwaiz1/cmp_luasnip'


    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    " Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'stevearc/conform.nvim'

    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

    Plug 'windwp/nvim-autopairs'


    " formatter
    Plug 'mhartington/formatter.nvim'

    " vim react snippets
    " Plug 'SirVer/ultisnips'
    " Plug 'mlaursen/vim-react-snippets'

    " fuzzy finder
    Plug 'echasnovski/mini.nvim'
    Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }



    " git integration "
    " for git fixing encoding codeto codebase
    Plug 'akinsho/git-conflict.nvim', { 'tag': '*' }
    " Plug
    Plug 'sindrets/diffview.nvim'

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
  black = '#000000',
  -- white = '#ffffff',
  mainBGcolor = '#262c36',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.white, bg = colors.mainBGcolor},
    b = { fg = colors.white, bg = colors.mainBGcolor},
    c = { fg = colors.white, bg = colors.mainBGcolor },
  },

  insert = { a = { fg = colors.white, bg = colors.mainBGcolor} },
  visual = { a = { fg = colors.white, bg = colors.mainBGcolor} },
  terminal = { a = { fg = colors.white, bg = colors.mainBGcolor} },
  command = { a = { fg = colors.white, bg = colors.mainBGcolor} },
  replace = { a = { fg = colors.white, bg = colors.mainBGcolor} },

 -- insert = { a = { fg = colors.white, bg = colors.black} },
 --  visual = { a = { fg = colors.violet, bg = colors.black} },
 --  terminal = { a = { fg = colors.cyan, bg = colors.black} },
 --  command = { a = { fg = colors.blue, bg = colors.black} },
 --  replace = { a = { fg = colors.blue, bg = colors.black} },


  inactive = {
    a = { fg = colors.white, bg = colors.mainBGcolor },
    b = { fg = colors.white, bg = colors.mainBGcolor },
    c = { fg = colors.black, bg = colors.mainBGcolor },
  },
}

require('lualine').setup({
  options = {
    icons_enabled = false,
    -- theme = 'tokyonight',
    theme = bubbles_theme,
    component_separators = ' | ',
    section_separators = { left = ' | ', right = ' | ' },
  },
  sections = {
    lualine_a = {
      { 'mode' },
    },
    lualine_b = {'filename', 'branch',  'location'},
    lualine_c = { 'filetype' },
    lualine_x = {''},
    lualine_y = { 'filetype' },
    lualine_z = {
      { 'diff', 'diagnostics',separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { '' },
    lualine_b = {''},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { '' },
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
        width = 60,
        number = true,
        side="left",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
       -- dotfiles = false,
       -- custom = {"^\\.git"}
       dotfiles = false,
       git_clean = false,
       no_buffer = false,
       custom = { "node_modules" },
       exclude={ ".env"}
  },
   update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    diagnostics = {
    enable = true,
    },
  ---
}

EOF

nnoremap <silent><C-e> :NvimTreeToggle<CR>
inoremap <silent><C-e> :NvimTreeToggle<CR>


set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.

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
    "vue",
    "vim",
    },


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
indent = {
enable = true
    },

}
EOF


" LSP setup
lua << EOF

-- Setup language servers.
local lspconfig = require('lspconfig')


-- Intelephense setup for PHP
lspconfig.intelephense.setup({
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,  -- Adjust if you have large files
            },
        },
    },
    on_attach = function(client, bufnr)
        -- Keymaps for LSP actions
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap=true, silent=true }

        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    end,
}) 

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
    -- tsserver = {},
  },
  -- you can do any additional lsp server setup here
  -- return true if you don't want this server to be setup with lspconfig
  ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
  setup = {
    -- example to setup with typescript.nvim
    -- tsserver = function(_, opts)
    --   require("typescript").setup({ server = opts })
    --   return true
    -- end,
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
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
        -- vim.lsp.buf.format { async = true }
    -- end, opts)
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


lspconfig.ts_ls.setup({
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
-- lspconfig.phpactor.setup({
-- capabilities = capabilities
-- })
-- lspconfig.phan.setup({
-- capabilities = capabilities
-- })

-- lspconfig.svelte.setup({
-- capabilities = capabilities
-- })

-- require'lspconfig'.svelte.setup{}

-- require'lspconfig'.vuels.setup{}

-- luasnip setup
local luasnip = require 'luasnip'
 -- Set up nvim-cmp.

-- luasnip added html to extend the html extention suggestion. now working
luasnip.filetype_extend("javascript", {"html"})
luasnip.filetype_extend("javascriptreact", {"html"})
luasnip.filetype_extend("typescriptreact", {"html"})
luasnip.filetype_extend("html", {"html"})
-- require("luasnip/loaders/from_vscode").lazy_load()



local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local cmp = require'cmp'
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
) -- require("luasnip.loaders.from_vscode").lazy_load()
  require("luasnip/loaders/from_vscode").lazy_load()


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
      {name = 'luasnip', keyword_length = 2},
      {name = 'buffer', keyword_length = 3}, -- { name = 'cmp_nvim_lsp' },
      -- { name = 'luasnip' , option = { use_show_condition = false, show_autosnippets=false} }, -- For luasnip users.
       -- { name = 'luasnip' }, -- For luasnip users.
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
require("mason-lspconfig").setup({
    ensure_installed = { "intelephense" },
})
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

" bufferline next and prev keymaps "
nnoremap <silent>]t :BufferLineCycleNext<CR>
nnoremap <silent>[t :BufferLineCyclePrev<CR>
nnoremap <silent>[ct :BufferLineCloseOthers<CR>


lua << EOF
-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

EOF



lua << EOF
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            min = severity
        },
        update_in_insert = true,
    }
)
EOF



lua << EOF
    require'nvim-tree.view'.View.winopts.relativenumber = true
EOF

lua << EOF
require('mini.pick').setup({
-- Your configuration here

  -- Delays (in ms; should be at least 1)
  delay = {
    -- Delay between forcing asynchronous behavior
    async = 10,

    -- Delay between computation start and visual feedback about it
    busy = 50,
  },

  -- Keys for performing actions. See `:h MiniPick-actions`.
  mappings = {
    caret_left  = '<Left>',
    caret_right = '<Right>',

    choose            = '<CR>',
    choose_in_split   = '<C-s>',
    choose_in_tabpage = '<C-t>',
    choose_in_vsplit  = '<C-v>',
    choose_marked     = '<M-CR>',

    delete_char       = '<BS>',
    delete_char_right = '<Del>',
    delete_left       = '<C-u>',
    delete_word       = '<C-w>',

    mark     = '<C-x>',
    mark_all = '<C-a>',

    move_down  = '<C-n>',
    move_start = '<C-g>',
    move_up    = '<C-p>',

    paste = '<C-r>',

    refine        = '<C-Space>',
    refine_marked = '<M-Space>',

    scroll_down  = '<C-f>',
    scroll_left  = '<C-h>',
    scroll_right = '<C-l>',
    scroll_up    = '<C-b>',

    stop = '<Esc>',

    toggle_info    = '<S-Tab>',
    toggle_preview = '<Tab>',
  },

  -- General options
  options = {
    -- Whether to show content from bottom to top
    content_from_bottom = false,

    -- Whether to cache matches (more speed and memory on repeated prompts)
    use_cache = false,
  },

  -- Source definition. See `:h MiniPick-source`.
  source = {
    items = nil,
    name  = nil,
    cwd   = nil,

    match   = nil,
    show    = nil,
    preview = nil,

    choose        = nil,
    choose_marked = nil,
  },

  -- Window related options
  window = {
    -- Float window config (table or callable returning it)
    config = nil,

    -- String to use as cursor in prompt
    prompt_cursor = '▏',

    -- String to use as prefix in prompt
    prompt_prefix = '> ',

    config = {
      width = 250,  -- Set your desired width here
      height = 20, -- Optionally set height too
      border = 'single', -- Customize border if you want
      row = vim.o.lines - 0,
      col = 2,  -- Optional, adjust positioning
    },
    winblend = 0, 
  },

})
require('mini.pairs').setup()
require('mini.completion').setup()

EOF

nnoremap <S-p> <Cmd>exe  ":Pick files"<CR>
nnoremap <S-o> <Cmd>exe  ":Pick grep_live"<CR>

let mapleader = " "

lua << EOF

-- Define the toggle function
local function toggle_diffview()
  local view = require("diffview.lib").get_current_view()
  if view then
    vim.cmd(":DiffviewClose")
  else
    vim.cmd(":DiffviewOpen")
  end
end

-- Set up Diffview with custom key mappings
require("diffview").setup({
  keymaps = {
    view = {
      ["<C-o>"] = ":DiffviewChooseOurs<CR>",
      ["<C-t>"] = ":DiffviewChooseTheirs<CR>",
      ["<C-b>"] = ":DiffviewChooseBase<CR>",
      ["<C-a>"] = ":DiffviewChooseAll<CR>",
    },
    file_panel = {
      -- Map Ctrl + G to toggle Diffview
      ["<C-p>"] = toggle_diffview,
    },
    view_panel = {
      -- Map Ctrl + G in view mode as well
      ["<C-p>"] = toggle_diffview,
    }
  }
})

require('git-conflict').setup()

-- Optionally, map Ctrl + G globally for normal mode to toggle Diffview
vim.keymap.set("n", "<C-p>", toggle_diffview, { noremap = true, silent = true })

EOF

let mapleader = " "
