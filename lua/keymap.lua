-- lua/keymap.lua

vim.o.completeopt = "menu,menuone,noinsert,noselect"

vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { noremap = true, silent = true })

-- Set options
vim.opt.number = true -- set number
vim.opt.relativenumber = true -- set relativenumber

vim.opt.autoindent = true -- set autoindent
vim.opt.smartindent = true -- set smartindent
vim.opt.history = 5000 -- set history=5000
vim.opt.clipboard = "unnamedplus"
vim.opt.scl = "no" -- set scl=no
vim.opt.modifiable = true -- set modifiable
vim.opt.hlsearch = false
vim.opt.showtabline = 0 -- set showtabline=0
vim.opt.incsearch = true -- set incsearch
vim.opt.encoding = "utf-8" -- set encoding=utf-8

-- indentions
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- Additional options
vim.opt.updatetime = 300 -- set updatetime=300
vim.opt.termguicolors = true -- set termguicolors
vim.opt.hidden = true -- set hidden
vim.opt.ignorecase = true -- set ignorecase
vim.opt.smartcase = true -- set smartcase
vim.opt.compatible = false -- set nocompatible
vim.o.splitright = true

vim.opt.signcolumn = "yes" -- Ensure the sign column is always visible

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.opt.statuscolumn =
			"%s%=%{v:lnum == line('.') ? printf('~ %d', v:lnum) : printf('%d', abs(v:lnum - line('.')))}"
		vim.cmd("highlight EndOfBuffer guifg=Grey")
	end,
})


-- http kulala
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "http", -- Adjust if Kulala uses a different file type
--   callback = function()
--     vim.api.nvim_buf_set_keymap(
--       0,  -- Current buffer only
--       "n",
--       "<[-r>",
--       "<cmd>:lua require('kulala').run()<cr>",
--       { noremap = true, silent = false, desc = "Execute the request" }
--     )
--   end
-- })

vim.api.nvim_set_keymap(
  "n",
  "]r",
  "<cmd>lua require('kulala').run()<cr>",
  { noremap = true, silent = true, desc = "Execute the request with Kulala" }
)

