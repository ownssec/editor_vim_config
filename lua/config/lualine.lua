-- lua/configs/lualine.lua

local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		icons_enabled = false,
		theme = {
			normal = { c = { fg = nil, bg = nil }, a = { fg = nil, bg = nil }, b = { fg = nil, bg = nil } },
			insert = { c = { fg = nil, bg = nil }, a = { fg = nil, bg = nil }, b = { fg = nil, bg = nil } },
			visual = { c = { fg = nil, bg = nil }, a = { fg = nil, bg = nil }, b = { fg = nil, bg = nil } },
			replace = { c = { fg = nil, bg = nil }, a = { fg = nil, bg = nil }, b = { fg = nil, bg = nil } },
			command = { c = { fg = nil, bg = nil }, a = { fg = nil, bg = nil }, b = { fg = nil, bg = nil } },
			inactive = { c = { fg = nil, bg = nil }, a = { fg = nil, bg = nil }, b = { fg = nil, bg = nil } },
		},
		component_separators = " | ",
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { { "mode" } },
		lualine_b = { "filename", "branch", "location", "progress" },
		lualine_c = { "" },
		lualine_x = { "" },
		lualine_y = { "filetype" },
		lualine_z = { { "filename", separator = { right = " | " }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "" },
		lualine_b = { "" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "" },
	},
	tabline = {},
	extensions = {},
})

-- OPTIONAL: Also make StatusLine fully transparent
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", fg = "none" })
