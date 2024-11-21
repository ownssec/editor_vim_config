"version 0.04
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

set updatetime=300

set termguicolors

set hidden
set ignorecase
set smartcase

set nocompatible
filetype off

let mapleader = ' '


call plug#begin()

    Plug 'numToStr/Comment.nvim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

    Plug 'ryanoasis/vim-devicons'
    Plug 'nvim-tree/nvim-web-devicons'

    Plug 'nvim-lualine/lualine.nvim'

    Plug 'nvim-tree/nvim-tree.lua'

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

    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

    " formatter
    Plug 'stevearc/conform.nvim'

    " fuzzy finder
    Plug 'echasnovski/mini.nvim'
    Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }


    " git integration "
    " for git fixing encoding code to codebase
    Plug 'akinsho/git-conflict.nvim', { 'tag': '*' }
call plug#end()




lua << EOF
require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },

  sidebars = {"qf", "help"},

  on_colors = function(colors)
        colors.bg = "#1f1f1f"
       colors.hint = colors.orange
        colors.error = colors.red
        colors.warning= colors.red
        colors.info= colors.red

        colors.info= colors.red

        colors.bg_sidebar = "#1f1f1f"
  end,

 on_highlights = function(highlights, colors)
  end,

})
vim.cmd("colorscheme tokyonight-night")
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
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#3c3c3c',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
  black = '#000000',
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

  inactive = {
    a = { fg = colors.white, bg = colors.mainBGcolor },
    b = { fg = colors.white, bg = colors.mainBGcolor },
    c = { fg = colors.black, bg = colors.mainBGcolor },
  },
}

require('lualine').setup({
  options = {
    icons_enabled = false,
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
  tabline = {},
  extensions = {},
})

EOF


lua << EOF
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-e>', api.tree.toggle,        opts('Up'))
  vim.keymap.set('n', 'f', api.tree.toggle_help,        opts('Up'))

end

require("nvim-tree").setup {
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
}

EOF

nnoremap <silent><C-e> :NvimTreeToggle<CR>
inoremap <silent><C-e> :NvimTreeToggle<CR>


set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
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

  sync_install = true,

  auto_install = true,

    highlight = {
    enable = true,

    additional_vim_regex_highlighting = true,
  },
indent = {
enable = true
    },

}
EOF

lua << EOF

local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

lspconfig.intelephense.setup({
    settings = {
        intelephense = {
            files = {
                maxSize = 5000000,
            },
        },
    },
    on_attach = on_attach,
})

lspconfig.ts_ls.setup({
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact" },
    on_attach = on_attach,
    capabilities = capabilities,
})

dependencies = {
  "jose-elias-alvarez/typescript.nvim",
  init = function()
    require("lazyvim.util").on_attach(function(_, buffer)
      vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
      vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
    end)
  end,
}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
 end,
})

local lspconfig = require('lspconfig')

lspconfig.cssls.setup({
 on_attach = on_attach,
 capabilities = capabilities
})

lspconfig.sqlls.setup({
capabilities = capabilities
})

lspconfig.html.setup({
capabilities = capabilities
})

local luasnip = require 'luasnip'

luasnip.filetype_extend("javascript", {"html"})
luasnip.filetype_extend("javascriptreact", {"html"})
luasnip.filetype_extend("typescriptreact", {"html"})
luasnip.filetype_extend("html", {"html"})

local cmp = require'cmp'
cmp.event:on('confirm_done')
  require("luasnip/loaders/from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),

    }),
    sources = cmp.config.sources({
     {name = 'path'},
      {name = 'nvim_lsp', keyword_length = 1},
      {name = 'luasnip', keyword_length = 2},
      {name = 'buffer', keyword_length = 3},
    }, {
      { name = 'buffer' },
    })

  })

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


lua << conformEOF
require("conform").setup({
  formatters_by_ft = {
    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 200,
  },
  format_after_save = {
    lsp_format = "fallback",
  },
  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
  notify_no_formatters = true,
  formatters = {
    my_formatter = {
      command = "my_cmd",
      args = { "--stdin-from-filename", "$FILENAME" },
      range_args = function(self, ctx)
        return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
      end,
      stdin = true,
      cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
      require_cwd = true,
      tmpfile_format = ".conform.$RANDOM.$FILENAME",
      condition = function(self, ctx)
        return vim.fs.basename(ctx.filename) ~= "README.md"
      end,
      exit_codes = { 0, 1 },
      env = {
        VAR = "value",
      },
      inherit = true,
      prepend_args = { "--use-tabs" },
      append_args = { "--trailing-comma" },
    },
    other_formatter = function(bufnr)
      return {
        command = "my_cmd",
      }
    end,
  },
})

conformEOF

set cursorline
hi CursorLineNr guifg=#ffffff
:lua vim.api.nvim_set_hl(0, 'LineNr', { fg = "#646d5f"})


lua << EOF
local bufferline = require('bufferline')
    bufferline.setup({
        options = {
            indicator = {
                icon = '*',
            },
            show_buffer_icons = false,
            show_duplicate_prefix = false,
            style_preset = bufferline.style_preset.no_italic,
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
                      highlight = "Directory",
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

  delay = {
    async = 10,
    busy = 50,
  },

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

  options = {
    content_from_bottom = false,
    use_cache = false,
  },

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

  window = {
    config = nil,

    prompt_cursor = '▏',

    prompt_prefix = '> ',

    config = {
      width = 250,
      height = 20,
      border = 'single',
      row = vim.o.lines - 0,
      col = 2,
    },
    winblend = 0,
  },

})
require('mini.pairs').setup()
require('mini.indentscope').setup(
{
  draw = {
       delay = 0,
      animation = require('mini.indentscope').gen_animation.linear({ duration = 10 }),
       priority = 2,
  },

  mappings = {
    object_scope = 'ii',
    object_scope_with_border = 'ai',
    goto_top = '[i',
    goto_bottom = ']i',
  },

  options = {
    border = 'both',
    indent_at_cursor = true,
    try_as_border = false,
  },

  symbol = '.',   --'╎',
})

vim.cmd([[highlight MiniIndentscopeSymbol guifg=#473e43]])
EOF



nnoremap <S-p> <Cmd>exe  ":Pick files"<CR>
nnoremap <S-o> <Cmd>exe  ":Pick grep_live"<CR>


lua << EOF

-- GitConflictChooseOurs — Select the current changes.
-- GitConflictChooseTheirs — Select the incoming changes.
-- GitConflictChooseBoth — Select both changes.
-- GitConflictChooseNone — Select none of the changes.
-- GitConflictNextConflict — Move to the next conflict.
-- GitConflictPrevConflict — Move to the previous conflict.
-- GitConflictListQf — Get all conflict to quickfix
require'git-conflict'.setup {
  default_mappings = {
    ours = 'o',
    theirs = 't',
    none = '0',
    both = 'b',
    next = 'n',
    prev = 'p',
  },
}
EOF
nnoremap <C-G> :GitConflictListQf<CR>

