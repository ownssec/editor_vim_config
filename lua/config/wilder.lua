-- lua/configs/wilder.lua
local wilder = require("wilder")

local width = "100%"
local height = "20%"

wilder.setup({
	modes = { ":", "/", "?" },
	next_key = "<C-n>",
	previous_key = "<C-p>",
	accept_key = "<Tab>",
	reject_key = "<C-c>",
	use_python_remote_plugin = 0,
})

wilder.set_option("pipeline", {
	wilder.branch(
		-- File and directory search with hidden files, excluding node_modules and .git
		wilder.python_file_finder_pipeline({
			file_command = {
				"rg",
				"--files",
				"--hidden",
				"--no-ignore",
				"--glob",
				"!**/node_modules/*",
				"--glob",
				"!**/.git/*",
			},
			dir_command = {
				"fd",
				"-td",
				"--hidden",
				"--no-ignore",
				"--exclude",
				"node_modules",
				"--exclude",
				".git",
			},
			filters = { "fuzzy_filter", "difflib_sorter" },
		}),

		wilder.cmdline_pipeline({
			language = "python",
			fuzzy = 1,
		}),

		wilder.python_search_pipeline({
			pattern = wilder.python_fuzzy_pattern(),
			sorter = wilder.python_difflib_sorter(),
			engine = "re",
			process_command = {
				"rg",
				"--smart-case",
				"--vimgrep",
				"--hidden",
				"--no-ignore",
				"--glob",
				"!**/node_modules/*",
				"--glob",
				"!**/.git/*",
			},
		}),

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
				pumblend = 0,
				border = { " ", " ", " ", " ~ ", " ", "", "", " " },
				highlights = { border = "WilderBorder" },
				max_width = width,
				min_width = width,
				max_height = height,
				min_height = height,
				reverse = 0,
			}))

			-- wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
			-- 	-- 'single', 'double', 'rounded' or 'solid'
			-- 	-- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
			-- 	border = "rounded",
			-- 	max_height = "75%", -- max height of the palette
			-- 	min_height = 0, -- set to the same as 'max_height' for a fixed height window
			-- 	prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
			-- 	reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
			-- }))
		)
	),
})

vim.api.nvim_set_hl(0, "WilderBorder", { fg = "#414243" }) -- border color
