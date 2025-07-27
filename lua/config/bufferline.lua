-- lua/configs/bufferline.lua

local bufferline = require("bufferline")
local bgColor = "#191616"

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

		highlights = {
			fill = {
				bg = bgColor,
			},
			background = {
				bg = bgColor,
			},
			buffer_selected = {
				bg = bgColor,
				italic = false,
				bold = false,
			},
			buffer_visible = {
				bg = bgColor,
			},
			separator = {
				bg = bgColor,
				fg = bgColor,
			},
			separator_selected = {
				bg = bgColor,
				fg = bgColor,
			},
			separator_visible = {
				bg = bgColor,
				fg = bgColor,
			},
			modified = {
				bg = bgColor,
			},
			modified_selected = {
				bg = bgColor,
			},
			modified_visible = {
				bg = bgColor,
			},
			duplicate = {
				bg = bgColor,
			},
			duplicate_selected = {
				bg = bgColor,
			},
			duplicate_visible = {
				bg = bgColor,
			},
			close_button = {
				bg = bgColor,
			},
			close_button_selected = {
				bg = bgColor,
			},
			close_button_visible = {
				bg = bgColor,
			},
			indicator_selected = {
				bg = bgColor,
			},
		},

		-- Hide buffers named "ui"
		-- custom_filter = function(buf_number, buf_numbers)
		-- 	local buf_name = vim.api.nvim_buf_get_name(buf_number)
		-- 	-- Exclude buffers containing "ui" in their name
		-- 	if buf_name:match("ui") then
		-- 		return false
		-- 	end
		-- 	return true
		-- end,
	},
})

-- Key mappings for BufferLine
-- vim.api.nvim_set_keymap("n", "<C-H>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-L>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-CT>", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-n>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[ct", ":BufferLineCloseOthers<CR>", { noremap = true, silent = true })
