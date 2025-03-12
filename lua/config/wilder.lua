-- lua/configs/wilder.lua

local wilder = require("wilder")
-- Initialize Wilder

wilder.setup({
	modes = { ":", "/", "?" },
	next_key = "<C-n>", -- Move to the next suggestion
	previous_key = "<C-p>", -- Move to the previous suggestion
	accept_key = "<Tab>",
	reject_key = "<C-c>", -- Reject the current suggestion
})

-- Set up pipelines
wilder.set_option("pipeline", {
	wilder.branch(
		wilder.python_file_finder_pipeline({
			file_command = {
				"find",
				".",
				"-type",
				"f",
				"!",
				"-path",
				"*/.git/*",
				"!",
				"-path",
				"*/node_modules/*",
				"-printf",
				"%P\n",
			},
			dir_command = {
				"find",
				".",
				"-type",
				"d",
				"!",
				"-path",
				"*/.git/*",
				"!",
				"-path",
				"*/node_modules/*",
				"-printf",
				"%P\n",
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
			process_command = { "rg", "--vimgrep", "--smart-case" }, -- Searches inside files
			engine = "re",
		})
	),
})

-- Set up renderer with highlighting
wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer({
		highlighter = wilder.basic_highlighter(), -- Enables per-word highlighting
		left = { " ", wilder.popupmenu_devicons() }, -- Adds file-type icons
		right = { " ", wilder.popupmenu_scrollbar() }, -- Adds scrollbar
	})
)
