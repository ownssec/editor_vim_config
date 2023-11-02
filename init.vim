set mouse=a
set number
set hidden
set expandtab 
set autoindent 
set smartindent
set shiftwidth=4
set tabstop=4
set encoding=UTF-8
set history=5000 
set clipboard=unnamedplus
set scl=no 
set buftype="buffer"
set modifiable
set hlsearch
" colorscheme tokyonight-moon
set noshowmode
set signcolumn=yes

let mapleader = ' '

call plug#begin('~/.config/nvim')
    Plug 'numToStr/Comment.nvim'
    Plug 'ryanoasis/vim-devicons' 
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

    Plug 'nvim-lualine/lualine.nvim'
    " If you want to have icons in your statusline choose one of these
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'


    Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
     Plug 'romgrk/barbar.nvim'


    Plug 'folke/tokyonight.nvim'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
    " or                                , { 'branch': '0.1.x' }

    " autocomplete
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For luasnip users.
    " Plug 'L3MON4D3/LuaSnip'
    " Plug 'saadparwaiz1/cmp_luasnip'


    " Use release branch (recommended)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    

call plug#end()



lua << EOF
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
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

  -- on_colors = function(colors) 
  --     colors.bg = "#1f1f1f"
  -- end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
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
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

EOF

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l



lua << EOF 
require('Comment').setup()
EOF

lua << EOF

-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#1f1f1f',
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
  tabline = {},
  extensions = {},
})

EOF

lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
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
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))

end


-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  ---
}

EOF

nnoremap <silent><C-e> :NvimTreeToggle<CR>
inoremap <silent><C-e> :NvimTreeToggle<CR>



lua << EOF
    require'lspconfig'.pyright.setup{}


    -- Setup language servers.
    local lspconfig = require('lspconfig')
    lspconfig.pyright.setup {}
    lspconfig.tsserver.setup {}
    lspconfig.rust_analyzer.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ['rust-analyzer'] = {},
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

" barbar tabs from active buffers

" Move to previous/next
nnoremap <silent><C-p> :BufferPrevious<CR>
nnoremap <silent><C-n> :BufferNext<CR>
nnoremap <silent><C-d> :BufferClose<CR>


" barbar tabs from active buffers
lua << EOF
vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup {
  -- WARN: do not copy everything below into your config!
  --       It is just an example of what configuration options there are.
  --       The defaults are suitable for most people.

  -- Enable/disable animations
  animation = true,

  -- Automatically hide the tabline when there are this many buffers left.
  -- Set to any value >=0 to enable.
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = false,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,  

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default), 'previous', and 'right'
  focus_on_close = 'left',

  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = {extensions = false},

  -- Disable highlighting alternate buffers
  highlight_alternate = false,

  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,

  -- Enable highlighting visible buffers
  highlight_visible = true,

  icons = {
    -- Configure the base icons on the bufferline.
    -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
    buffer_index = false,
    buffer_number = false,
    button = '',
    -- Enables / disables diagnostic symbols
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      -- Sets the icon's highlight group.
      -- If false, will use nvim-web-devicons colors
      custom_colors = false,

      -- Requires `nvim-web-devicons` if `true`
      enabled = false,
    },
    separator = {left = '', right = ' ▎'},

    -- If true, add an additional separator at the end of the buffer list
    separator_at_end = true,

    -- Configure the icons on the bufferline when modified or pinned.
    -- Supports all the base icon options.
    modified = {button = '*'}, -- ●●●●●●
    pinned = {button = '', filename = true},

    -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
    preset = 'default',

    -- Configure the icons on the bufferline based on the visibility of a buffer.
    -- Supports all the base icon options, plus `modified` and `pinned`.
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- Sets the minimum buffer name length.
  minimum_length = 0,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Use the default values: {event = 'BufWinLeave', text = nil}
    NvimTree = true,
    -- Or, specify the text used for the offset:
    undotree = {text = 'undotree'},
    -- Or, specify the event which the sidebar executes when leaving:
    ['neo-tree'] = {event = 'BufWipeout'},
    -- Or, specify both
    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustment
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}
EOF



lua << EOF
require('telescope').setup{}
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fw <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" lua << EOF
"   local cmp = require'cmp'
"       cmp.setup({
"    snippet = {
"       -- REQUIRED - you must specify a snippet engine
"       expand = function(args)
"        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
"         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
"         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
"         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
"       end,
"     },
"     window = {
"       -- completion = cmp.config.window.bordered(),
"       -- documentation = cmp.config.window.bordered(),
"     },
"     mapping = cmp.mapping.preset.insert({
"       ['<C-k>'] = cmp.mapping.select_prev_item(),
"       ['<C-j>'] = cmp.mapping.select_next_item(),
"       ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
"     }),
"     sources = cmp.config.sources({
"       { name = 'nvim_lsp' },
"       { name = 'luasnip' }, -- For luasnip users.
"       -- { name = 'ultisnips' }, -- For ultisnips users.
"       -- { name = 'snippy' }, -- For snippy users.
"     }, {
"       { name = 'buffer' },
"     })
"   })
"
"   -- Set configuration for specific filetype.
"   cmp.setup.filetype('gitcommit', {
"     sources = cmp.config.sources({
"       { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
"     }, {
"       { name = 'buffer' },
"     })
"   })
"
"   -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline({ '/', '?' }, {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = {
"       { name = 'buffer' }
"     }
"   })
"
"   cmp.setup.cmdline(':', {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = cmp.config.sources({
"       { name = 'path' }
"     }, {
"       { name = 'cmdline' }
"     })
"   })
" EOF

" coc config


set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-highlight',
  \ 'coc-html-css-support',
  \ 'coc-just-complete',
  \ 'coc-lua',
  \ 'coc-prettier',
  \ 'coc-css',
  \ 'coc-stylelint',
  \ 'coc-stylelintplus',
  \ 'coc-vimlsp',
  \ 'coc-clangd',
  \ 'coc-vetur',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-explorer',
  \  'coc-eslint',
  \  'coc-prettier',
  \  'coc-snippets',
  \  '@yaegassy/coc-laravel',
  \  'coc-golines'
  \ ]

set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
     \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<TAB>'

if has('nvim-0.4.0') || has('patch-8.2.0750')
    inoremap <silent><nowait><expr>  <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
    inoremap <silent><nowait><expr>  <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
endif

" lua << EOF
" local keyset = vim.keymap.set
"
" -- Formatting selected code
" keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
" keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

" EOF

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
