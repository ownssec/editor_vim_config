-- lua/configs/lualine.lua

local status, lualine = pcall(require, "lualine")
if not status then
	return
end

lualine.setup({
	options = {
		icons_enabled = false,
		theme = "auto",
		component_separators = " | ",
		section_separators = { left = " | ", right = " | " },
	},
	sections = {
		lualine_a = {
			{ "mode" },
		},
		lualine_b = { "filename", "branch", "location" },
		lualine_c = { "filetype" },
		lualine_x = { "" },
		lualine_y = { "filetype" },
		lualine_z = {
			{ "diff", "diagnostics", separator = { right = "" }, left_padding = 2 },
		},
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

-- vim.cmd([[hi! Normal guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi! StatusLine guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi! StatusLineNC guibg=NONE ctermbg=NONE]])
