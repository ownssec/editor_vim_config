-- lua/keymap.lua

vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { noremap = true, silent = true })

-- Set options
vim.opt.number = true -- set number
vim.opt.relativenumber = true -- set relativenumber
vim.opt.expandtab = true -- set expandtab
vim.opt.autoindent = true -- set autoindent
vim.opt.smartindent = true -- set smartindent
vim.opt.shiftwidth = 4 -- set shiftwidth=4
vim.opt.tabstop = 4 -- set tabstop=4
vim.opt.history = 5000 -- set history=5000
vim.opt.clipboard = "unnamedplus" -- set clipboard=unnamedplus
vim.opt.scl = "no" -- set scl=no
vim.opt.modifiable = true -- set modifiable
vim.opt.hlsearch = true -- set hlsearch
vim.opt.showtabline = 0 -- set showtabline=0
vim.opt.incsearch = true -- set incsearch
vim.opt.encoding = "utf-8" -- set encoding=utf-8

-- Additional options
vim.opt.updatetime = 300 -- set updatetime=300
vim.opt.termguicolors = true -- set termguicolors
vim.opt.hidden = true -- set hidden
vim.opt.ignorecase = true -- set ignorecase
vim.opt.smartcase = true -- set smartcase
vim.opt.compatible = false -- set nocompatible
vim.opt.filetype = "off" -- set filetype off
