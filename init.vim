set mouse=a
set number
set hidden
set expandtab 
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set encoding=utf8
set history=5000
set clipboard=unnamedplus
set scl=no
set buftype="buffer"
set modifiable
colorscheme tokyonight



call plug#begin()
    Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'


Plug 'preservim/nerdtree'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

lua << EOF
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local DEFAULT_SETTINGS = {
    ensure_installed = {
                "css-lsp", 
                "lua_ls", 
                "custom-elements-languageserver",
                "eslint-lsp",
                "eslint_d",
                "html-lsp",
                "jsonlint",
                "lua-language-server",
                "prettierd",
                "sql-formatter",
                "sqlfmt",
                "stylelint",
                "tailwindcss-language-server",
                "templ",
                "vetur-vls",
                "vue-language-server"
             },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = true,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    handlers = nil,
}
EOF


autocmd StdinReadPre * let s:std_in=1

let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIgnore = ['^node_modules$']

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <c-z> :u<CR>      
inoremap <c-z> <c-o>:u<CR>

noremap <C-w> :Commentary<cr>


:lua require("toggleterm").setup()


lua << EOF
require'toggleterm'.setup {
  shade_terminals = false
}

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF

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
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF

