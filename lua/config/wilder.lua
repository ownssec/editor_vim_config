-- lua/configs/wilder.lua
local wilder = require("wilder")
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
		})
	),
})

local width = "100%"
local height = "20%"

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
)

vim.api.nvim_set_hl(0, "WilderBorder", { fg = "#414243" }) -- border color
