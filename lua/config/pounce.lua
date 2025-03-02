-- lua/configs/pounce.lua
--
-- motions

require("pounce").setup({
	accept_keys = "asdfghjklqwertyuiopzxcvbnm0123456789", -- Keys for jumping
	accept_best_key = "<enter>", -- Automatically jump to best match
	multi_window = true, -- Search across multiple windows
	debug = false,
})

-- Keybindings
vim.api.nvim_set_keymap("n", "f", "<cmd>Pounce<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "f", "<cmd>Pounce<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("o", "f", "<cmd>Pounce<CR>", { noremap = true, silent = true })
