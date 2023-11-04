set mouse=a
set number 
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

" colorscheme tokyonight-moon
set noshowmode
set signcolumn=yes

set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" In your init.lua or init.vim
set termguicolors

set hidden  


let mapleader = ' '

call plug#begin('~/.config/nvim')

    " Use release branch (recommended)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'numToStr/Comment.nvim'
    Plug 'ryanoasis/vim-devicons' 
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

    Plug 'nvim-lualine/lualine.nvim'
    " If you want to have icons in your statusline choose one of these
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-tree/nvim-tree.lua'

    Plug 'folke/tokyonight.nvim'
  
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'jiangmiao/auto-pairs'

    Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
    



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
   -- disabled_filetypes = {  'NVimTree' },
  tabline = {},
  extensions = {},
})

EOF

lua << EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
  vim.keymap.set('n', '<C-f>', api.tree.toggle_help,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,  opts('Help'))

end

-- pass to setup along with your other options require("nvim-tree").setup {
require("nvim-tree").setup {
  on_attach = my_on_attach,
  view ={
    width = 30,
  },
update_focused_file = {
    enable = false,
    update_root = false,
  },
  actions = {
    change_dir = {
      enable = false,
    }
  }
  ---
}

EOF

nnoremap <silent><C-e> :NvimTreeToggle<CR>
inoremap <silent><C-e> :NvimTreeToggle<CR>


" coc config


    let g:coc_global_extensions = [
      \ 'coc-html',
      \ 'coc-highlight',
      \ 'coc-html-css-support',
      \ 'coc-just-complete',
      \ 'coc-lua',
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
      \  'coc-snippets',
      \  '@yaegassy/coc-laravel',
      \  'coc-golines',
      \  'coc-sh',
      \  'coc-pyright',
      \  'coc-cfn-lint',
      \  'coc-clang-format-style-options'
      \ ]

    " 'coc-prettier',


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

    inoremap <silent><nowait><expr>  <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
    inoremap <silent><nowait><expr>  <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"



    " treesitter

    lua << EOF
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
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
      "vue"},

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      ignore_install = { "" },

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


