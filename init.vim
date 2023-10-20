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

autocmd ColorScheme *
        \ highlight constant ctermfg=160 |
        \ highlight special ctermfg=11
colorscheme  tokyonight



"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"overwrite ctrl+z that close vim
nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>

"comment
"noremap <C-w> :Commentary<cr>

" treesitter 
lua << EOF
require("nvim-treesitter.configs").setup({
    ensure_installed = {'javascript',
                'typescript', 
                "lua", 
                "vim", 
                "json", 
                "html", 
                "tsx",
                "css",
                "http",
                "jsonnet",
                "php",
                "sql",
                "vue" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
})
EOF

"enable toggle term
:lua require("toggleterm").setup()


"terminal toggle 
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-1> <Cmd>exe "ToggleTerm 1"<CR>

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-2> <Cmd>exe "ToggleTerm 2"<CR>


autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-3> <Cmd>exe "ToggleTerm 3"<CR>

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><A-4> <Cmd>exe "ToggleTerm 4"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2

nnoremap <silent><A-1> <Cmd>exe  "ToggleTerm 1"<CR>
inoremap <silent><A-1> <Esc><Cmd>exe  "ToggleTerm 1"<CR>

nnoremap <silent><A-2> <Cmd>exe  "ToggleTerm 2"<CR>
inoremap <silent><A-2> <Esc><Cmd>exe  "ToggleTerm 2"<CR>

nnoremap <silent><A-3> <Cmd>exe  "ToggleTerm 3"<CR>
inoremap <silent><A-3> <Esc><Cmd>exe  "ToggleTerm 3"<CR>


nnoremap <silent><A-4> <Cmd>exe  "ToggleTerm 4"<CR>
inoremap <silent><A-4> <Esc><Cmd>exe  "ToggleTerm 4"<CR>



tnoremap <silent><C-j> <Cmd>exe  "wincmd j"<CR>
tnoremap <silent><C-k> <Cmd>exe  "wincmd k"<CR>
tnoremap <silent><C-h> <Cmd>exe  "wincmd h"<CR>
tnoremap <silent><C-l> <Cmd>exe  "wincmd l"<CR>


:lua require("./plugins")


