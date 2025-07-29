-- lua/configs/kulala.lua

require("kulala").setup({
	debug = true,
	default_env = "dev",
	transparent = false,
	terminal_colors = true,
	winbar = true,
	default_winbar_panes = { "body", "verbose", "report" },
	-- default_winbar_panes = { "body", "headers", "verbose" },
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "http", -- Adjust this to match the file type used by kulala
	callback = function()
		vim.api.nvim_set_keymap(
			"n",
			"[[",
			":lua require('kulala').jump_prev()<CR>",
			{ noremap = true, silent = true, desc = "Jump to the previous request" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"]]",
			":lua require('kulala').jump_next()<CR>",
			{ noremap = true, silent = true, desc = "Jump to the previous request" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"]r",
			"<cmd>lua require('kulala').run()<CR>",
			{ noremap = true, silent = true, desc = "Execute the request with Kulala" }
		)

		vim.api.nvim_set_keymap(
			"n",
			"[d",
			"<cmd>lua require('kulala').set_selected_env('dev')<CR>",
			{ noremap = true, silent = true, desc = "Select environment with Kulala" }
		)
		-- vim.api.nvim_set_keymap(
		-- 	"n",
		-- 	"[t",
		-- 	"<cmd>lua require('kulala').set_selected_env('testing')<CR>",
		-- 	{ noremap = true, silent = true, desc = "Select environment with Kulala" }
		-- )
		vim.api.nvim_set_keymap(
			"n",
			"[s",
			"<cmd>lua require('kulala').set_selected_env('staging')<CR>",
			{ noremap = true, silent = true, desc = "Select environment with Kulala" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"[p",
			"<cmd>lua require('kulala').set_selected_env('prod')<CR>",
			{ noremap = true, silent = true, desc = "Select environment with Kulala" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"[a",
			"<cmd>lua require('kulala').run_all()<CR>",
			{ noremap = true, silent = true, desc = "Send all requests with Kulala" }
		)
	end,
})

-- vim.api.nvim_create_autocmd("BufWinEnter", {
-- 	callback = function()
-- 		local bufname = vim.api.nvim_buf_get_name(0) -- Get full buffer name (with path)
-- 		if vim.fn.fnamemodify(bufname, ":t") == "ui" then -- Extract filename and check
-- 			vim.cmd("vertical resize 80")
-- 		end
-- 	end,
-- })
