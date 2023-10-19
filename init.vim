set mouse=a
set number
set relativenumber
set hidden
"set cursorline
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
"set encoding=utf8
set history=5000
set clipboard=unnamedplus
set scl=no

call plug#begin()
# Plugins
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plugin 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
call plug#end()


" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
   "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-html',
  \  'coc-prettier'
  \ ]



"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"close vim
nnoremap <c-z> :u<CR>      " Avoid using this**
inoremap <c-z> <c-o>:u<CR>


#comment
noremap <C-/> :Commentary<cr>


