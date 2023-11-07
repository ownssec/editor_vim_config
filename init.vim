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
set autochdir
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
set incsearch

set hidden  
set ignorecase
set smartcase

set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ' '

call plug#begin('~/.config/nvim')

    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'numToStr/Comment.nvim'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

    Plug 'ryanoasis/vim-devicons' 
	Plug 'nvim-tree/nvim-web-devicons' " optional

    Plug 'nvim-lualine/lualine.nvim'

	Plug 'nvim-tree/nvim-tree.lua'

    Plug 'folke/tokyonight.nvim'
  
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'jiangmiao/auto-pairs'

    Plug 'nvim-lua/plenary.nvim'


    Plug 'lewis6991/gitsigns.nvim'

    if has('nvim')
      function! UpdateRemotePlugins(...)
        " Needed to refresh runtime files
        let &rtp=&rtp
        UpdateRemotePlugins
      endfunction

      Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
    else
      Plug 'gelguy/wilder.nvim'

      " To use Python remote plugin features in Vim, can be skipped
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

    Plug 'nixprime/cpsm'

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
  vim.keymap.set('n', 'f', api.tree.toggle_help,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))

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
    dotfiles = true,
  },
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
      \  '@yaegassy/coc-intelephense',
      \  'coc-golines',
      \  'coc-sh',
      \  'coc-pyright',
      \  'coc-cfn-lint',
      \  'coc-clang-format-style-options'
      \ ]

    " 'coc-prettier',
      "\  'coc-git',


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


lua << EOF
require('gitsigns').setup {
  signs = {
    add          = { text = '│' },
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
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
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

" nixprice /cpsm plugin

let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
  
call wilder#setup({
  \ 'modes': [':', '/', '?'],
  \ 'next_key': '<Tab>',
  \ 'previous_key': '<S-Tab>',
  \ 'accept_key': '<Down>',
  \ 'reject_key': '<Up>',
  \ })


let g:loaded_remote_plugins     = 1

lua << EOF

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()},
}))
EOF

