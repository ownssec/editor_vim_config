-- lua/configs/kulala.lua

require("kulala").setup({
	debug = true,
	default_env = "dev",
	transparent = false,
	terminal_colors = true,
	winbar = true,
	default_winbar_panes = { "body", "headers", "verbose" },
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
	},
	sidebars = { "qf", "vista_kind", "terminal", "packer" },
	on_colors = function(colors)
		colors.border = "#ff0000" -- Example: Custom border color
	end,
	on_highlights = function(hl, c)
		hl.Normal = { bg = c.bg, fg = c.fg }
		hl.CursorLineNr = { fg = c.orange, bold = true }
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.http",
	callback = function()
		vim.bo.filetype = "http" -- Set the filetype to 'http'
		vim.cmd("runtime syntax/http.vim") -- Load the custom syntax file
		vim.cmd("setlocal syntax=on") -- Enable syntax highlighting
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "http", -- Adjust this to match the file type used by kulala
	callback = function()
		vim.api.nvim_set_keymap(
			"n",
			"]e",
			":lua require('kulala').jump_next()<CR>",
			{ noremap = true, silent = true, desc = "Jump to the previous request" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"[e",
			":lua require('kulala').jump_prev()<CR>",
			{ noremap = true, silent = true, desc = "Jump to the previous request" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"]r",
			"<cmd>lua require('kulala').run()<CR>",
			{ noremap = true, silent = true, desc = "Execute the request with Kulala" }
		)
	end,
})
