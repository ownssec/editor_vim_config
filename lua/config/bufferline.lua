-- lua/configs/bufferline.lua

local bufferline = require("bufferline")

bufferline.setup({
	options = {
		indicator = {
			icon = "", -- Set the indicator icon
		},
		show_buffer_icons = false, -- Hide buffer icons
		show_duplicate_prefix = false, -- Hide duplicate prefixes
		show_tab_indicators = false,
		buffer_close_icon = "-",
		modified_icon = "-",
		close_icon = "-",
		style_preset = { -- Set style presets
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
		},
		enforce_regular_tabs = true, -- Enforce regular tabs
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			if context.buffer:current() then
				return ""
			end
			return "" -- Show diagnostics indicator
		end,
		offsets = {
			{
				filetype = "NvimTree", -- Set offset for NvimTree
				text = "",
				highlight = "Directory",
			},
		},
	},
})

-- Key mappings for BufferLine
vim.api.nvim_set_keymap("n", "]t", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[t", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[ct", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })
