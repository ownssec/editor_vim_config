-- lua/keymap.lua

vim.o.completeopt = "menu,menuone,noinsert,noselect"

vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "[ct", ":%bd|e#|bd#<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "[p", ":ls<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "]t", ":bnext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "[t", ":bprevious<CR>", { noremap = true, silent = true })
