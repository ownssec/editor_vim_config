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
			file_command = { "find", ".", "-type", "f", "-printf", "%P\n" },
			dir_command = { "find", ".", "-type", "d", "-printf", "%P\n" },
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

--- GREP
-- lua
vim.opt.grepprg = "rg --vimgrep -uu"
vim.opt.grepformat = "%f:%l:%c:%m"

-- lua
-- use <Leader>gg to open quickfix list and Grep for a query
vim.keymap.set("n", "<C-o>", ":copen | :silent :grep ")
vim.keymap.set("n", "<C-p>", ":e ")

-- use ]q and [q to cycle through quickfix list

vim.keymap.set("n", "[q", function()
	local qf_info = vim.fn.getqflist({ idx = 0, size = 0 })
	if qf_info.size > 0 and qf_info.idx > 1 then
		vim.cmd("cprev")
	end
end, { noremap = true, silent = true })

vim.keymap.set("n", "]q", function()
	local qf_info = vim.fn.getqflist({ idx = 0, size = 0 })
	if qf_info.size > 0 and qf_info.idx < qf_info.size then
		vim.cmd("cnext")
	end
end, { noremap = true, silent = true })
