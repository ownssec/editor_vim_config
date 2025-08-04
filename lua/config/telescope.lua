local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

local telescope = require("telescope")

telescope.setup({
	pickers = {
		buffers = {
			sort_lastused = true,
			-- Other options for the buffers picker can go here, e.g.,
			ignore_current_buffer = true,
			-- show_all_buffers = false,
		},
	},
	defaults = {
		layout_strategy = "bottom_pane",
		layout_config = {
			prompt_position = "bottom",
			preview_width = 0.7,
			width = 0.80,
			height = 0.35,
			preview_cutoff = 1,
		},
		sorting_strategy = "descending",
		path_display = { "smart", "truncate" },
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = " ",
		winblend = 5,
		results_title = false,
		preview_title = false,
		preview = {
			-- Set line numbers
			number = true,
			relativenumber = false,
		},
		file_ignore_patterns = {
			"%.git/",
			"node_modules/",
			"%.cache/",
			"%.o",
			"%.out",
			"%.class",
			"__pycache__",
		},
		mappings = {
			i = {
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<Esc>"] = require("telescope.actions").close,
			},
		},
	},
})
-- Load extensions if installed
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "file_browser")

-- Keymaps
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<C-o>", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<C-i>", builtin.buffers, { desc = "List Buffers" })

vim.keymap.set("n", "[ct", function()
	local current = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
			if buf ~= current then
				vim.cmd("bdelete " .. buf)
			end
		end
	end
end, { desc = "Delete all buffers except current" })

-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
-- vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File Browser" })
