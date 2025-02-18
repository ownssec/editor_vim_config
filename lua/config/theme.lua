-- lua/configs/editortheme.lua

-- vim.opt.termguicolors = true
-- vim.opt.background = "dark" -- Set background to light (or "dark" if preferred)
-- vim.cmd("colorscheme zenwritten")

require("tokyonight").setup({
	style = "night",
	light_style = "day",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},

	sidebars = { "qf", "help" },

	on_colors = function(colors)
		colors.bg = "#1f1f1f"
		colors.hint = colors.orange
		colors.error = colors.red
		colors.warning = colors.red
		colors.info = colors.red
		colors.bg_sidebar = "#1f1f1f"
	end,

	on_highlights = function(highlights, colors)
		-- Customize highlights here if needed
	end,
})

vim.cmd("colorscheme tokyonight-night")
