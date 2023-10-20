set mouse=a
set number
set hidden
"set cursorline
set expandtab 
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set encoding=utf8
set history=5000
set clipboard=unnamedplus
set scl=no
set buftype=""
let mapleader = ' '



call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIgnore = ['^node_modules$']

"source https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
let g:coc_global_extensions = ['coc-json', 
            \  'coc-git',
            \  'coc-html',
            \   'coc-tslint',
                \  'coc-eslint',
                \  'coc-clangd',
                \  'coc-css',
                \ 'coc-vetur',
                \ 'coc-rome',
                \ 'coc-prettier',
                \'coc-cssmodules',
                \'coc-explorer',
                \   'coc-htmlhint',
                \   'coc-html-css-support',
                \   'coc-markdownlint',
                \   'coc-sql',
                \   'coc-stylelintplus',
                \   'coc-tailwindcss',
                \ ]

let g:ensure_installed = ['html']



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


"terminal toggle 
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>


" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2

nnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><C-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

"comment
"noremap <C-w> :Commentary<cr>


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
