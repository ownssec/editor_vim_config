local status, toggleterm = pcall(require, "toggleterm")

if not status then
  return
end

toggleterm.setup()

-- Key mappings for different terminals (1 to 4)
local keymap_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<A-1>", "<Cmd>exe 'ToggleTerm 1'<CR>", keymap_opts)
vim.api.nvim_set_keymap("i", "<A-1>", "<Esc><Cmd>exe 'ToggleTerm 1'<CR>", keymap_opts)
vim.api.nvim_set_keymap("t", "<A-1>", "<Cmd>exe 'ToggleTerm 1'<CR>", keymap_opts)

vim.api.nvim_set_keymap("n", "<A-2>", "<Cmd>exe 'ToggleTerm 2'<CR>", keymap_opts)
vim.api.nvim_set_keymap("i", "<A-2>", "<Esc><Cmd>exe 'ToggleTerm 2'<CR>", keymap_opts)
vim.api.nvim_set_keymap("t", "<A-2>", "<Cmd>exe 'ToggleTerm 2'<CR>", keymap_opts)

vim.api.nvim_set_keymap("n", "<A-3>", "<Cmd>exe 'ToggleTerm 3'<CR>", keymap_opts)
vim.api.nvim_set_keymap("i", "<A-3>", "<Esc><Cmd>exe 'ToggleTerm 3'<CR>", keymap_opts)
vim.api.nvim_set_keymap("t", "<A-3>", "<Cmd>exe 'ToggleTerm 3'<CR>", keymap_opts)

vim.api.nvim_set_keymap("n", "<A-4>", "<Cmd>exe 'ToggleTerm 4'<CR>", keymap_opts)
vim.api.nvim_set_keymap("i", "<A-4>", "<Esc><Cmd>exe 'ToggleTerm 4'<CR>", keymap_opts)
vim.api.nvim_set_keymap("t", "<A-4>", "<Cmd>exe 'ToggleTerm 4'<CR>", keymap_opts)

-- Function to set terminal keymaps
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- Autocommand to set keymaps for terminal buffers
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

