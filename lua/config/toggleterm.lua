local status, toggleterm = pcall(require, "toggleterm")

if not status then
	return
end

toggleterm.setup({
	open_mapping = [[<A-`>]],
	shade_terminals = true,
	direction = "horizontal",
	float_opts = {
		border = "none",
		width = vim.o.columns,
		height = vim.o.lines,
		winblend = 0,
	},
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		vim.opt.relativenumber = true -- Enable relative line numbers
		vim.opt.number = true -- Enable absolute line numbers
		vim.opt.signcolumn = "yes" -- Ensure the sign column is always visible
	end,
})

local keymap_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<A-`>", "<Cmd>ToggleTerm 5 direction=float<CR>", keymap_opts)
vim.api.nvim_set_keymap("i", "<A-`>", "<Esc><Cmd>ToggleTerm 5 direction=float<CR>", keymap_opts)
vim.api.nvim_set_keymap("t", "<A-`>", "<Cmd>ToggleTerm 5 direction=float<CR>", keymap_opts)

-- Keep the existing keybindings for terminals 1-4
for i = 1, 4 do
	vim.api.nvim_set_keymap("n", "<A-" .. i .. ">", "<Cmd>exe 'ToggleTerm " .. i .. "'<CR>", keymap_opts)
	vim.api.nvim_set_keymap("i", "<A-" .. i .. ">", "<Esc><Cmd>exe 'ToggleTerm " .. i .. "'<CR>", keymap_opts)
	vim.api.nvim_set_keymap("t", "<A-" .. i .. ">", "<Cmd>exe 'ToggleTerm " .. i .. "'<CR>", keymap_opts)
end

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- Autocommand to set keymaps for terminal buffers
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
