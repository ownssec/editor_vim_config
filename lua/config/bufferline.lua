-- lua/configs/bufferline.lua

local bufferline = require("bufferline")
local bgColor = "#191616"
local bgActiveColor = "#2f3030"
local fgColor = "#a3a19e"

-- Track the current active buffer ID
_G.current_buf_id = vim.api.nvim_get_current_buf()
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		_G.current_buf_id = vim.api.nvim_get_current_buf()
	end,
})

bufferline.setup({
	options = {
		show_buffer_icons = false,
		show_tab_indicators = false,
		style_preset = {
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
		},
		buffer_close_icon = "-",
		modified_icon = "-",
		close_icon = "-",
		indicator = {
			icon = "",
			style = "none",
		},
	},
	highlights = {
		fill = { bg = bgColor },
		background = { bg = bgColor },
		buffer_visible = { bg = bgColor },
		buffer_selected = {
			-- bg = bgColor,
			bg = bgActiveColor,
			fg = fgColor,
			bold = true,
			underline = false,
		},
		close_button = {
			bg = bgColor,
			fg = fgColor,
		},
		close_button_visible = {
			bg = bgColor,
			fg = fgColor,
		},
		close_button_selected = {
			bg = bgColor,
			fg = fgColor,
		},
		separator = { bg = bgColor, fg = bgColor },
		separator_visible = { bg = bgColor, fg = bgColor },
		separator_selected = { bg = bgColor, fg = bgColor },
		duplicate = { bg = bgColor },
		duplicate_visible = { bg = bgColor },
		duplicate_selected = { bg = bgColor },
		modified = { bg = bgColor },
		modified_visible = { bg = bgColor },
		modified_selected = { bg = bgColor },
		tab = { bg = bgColor },
		tab_selected = { bg = bgColor },
		tab_close = { bg = bgColor },
		indicator_selected = { bg = bgColor },
	},
})

vim.api.nvim_set_keymap("n", "<C-n>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[ct", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })
