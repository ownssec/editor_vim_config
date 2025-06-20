local status, toggleterm = pcall(require, "toggleterm")

if not status then
	return
end

toggleterm.setup({
	shade_terminals = true,
	direction = "horizontal",
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.columns * 0.09
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	shading_factor = 1,
	responsiveness = {
		-- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
		-- instead of next to each other
		-- default = 0 which means the feature is turned off
		horizontal_breakpoint = 135,
	},
})

toggleterm.setup({
	shade_terminals = true,
	direction = "horizontal",
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.columns * 0.09
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	shading_factor = 1,
	responsiveness = {
		-- breakpoint in terms of `vim.o.columns` at which terminals will start to stack on top of each other
		-- instead of next to each other
		-- default = 0 which means the feature is turned off
		horizontal_breakpoint = 135,
		-- hades,
	},

	highlights = {
		Normal = {
			guibg = bg_dark,
		},
	},
	on_open = function(term)
		if term.direction == "horizontal" then
			local width = vim.api.nvim_win_get_width(term.window)
			local border = string.rep("`", width) -- You can use "─", "═", "▔", etc.

			-- Set the winbar with proper highlighting
			vim.api.nvim_win_set_option(term.window, "winbar", "%#ToggleTermBorderRed#" .. border)

			-- Alternative approach that might work better in some cases:
			-- vim.api.nvim_win_set_option(term.window, "winbar", border)
			-- vim.api.nvim_win_set_option(term.window, "winhl", "WinBar:ToggleTermBorderRed")
		end
	end, -- Optional: Clear the border when terminal closes
	on_close = function(term)
		if term.direction == "horizontal" then
			vim.api.nvim_win_set_option(term.window, "winbar", "")
		end
	end,
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
