set mouse=a
" set number
set relativenumber
" set hidden
"set cursorline
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4 set encoding=utf8
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
call plug#end()

"open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIgnore = ['^node_modules$']

let g:coc_global_extensions = [
            \  'coc-tsserver',
            \ 'coc-json',
            \ 'coc-css',
            \   'coc-eslint',
            \ 'coc-html',
            \ 'coc-prettier'
   ]



"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l



nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"overwrite ctrl+z that close vim
nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>


"comment
"noremap <C-w> :Commentary<cr>


