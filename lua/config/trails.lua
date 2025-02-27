require("trailblazer").setup({
	auto_save_trailblazer_state_on_exit = true,
	auto_load_trailblazer_state_on_enter = true,
	trail_mark_session_storage_dir = vim.fn.stdpath("data") .. "/trailblazer",
	-- your custom config goes here
	mappings = { -- rename this to "force_mappings" to completely override default mappings and not merge with them
		nv = { -- Mode union: normal & visual mode. Can be extended by adding i, x, ...
			motions = {
				new_trail_mark = "ma",
				-- track_back = "<A-b>",
				peek_move_next_down = "]e",
				peek_move_previous_up = "[e",
				-- move_to_nearest = "<A-n>",
				toggle_trail_mark_list = "<C-m>",
			},
			actions = {
				delete_all_trail_marks = "[c",
				-- paste_at_last_trail_mark = "<A-p>",
				-- paste_at_all_trail_marks = "<A-P>",
				-- set_trail_mark_select_mode = "<A-t>",
				-- switch_to_next_trail_mark_stack = "<A-.>",
				-- switch_to_previous_trail_mark_stack = "<A-,>",
				-- set_trail_mark_stack_sort_mode = "<A-s>",
			},
		},
	},
	trail_options = {
		mark_symbol = "✢", -- Used when trail_mark_symbol_line_indicators_enabled is true
		newest_mark_symbol = "✢", -- Symbol for the most recent mark
		cursor_mark_symbol = "✢", -- Symbol for the cursor mark
		next_mark_symbol = "✢", -- Symbol for the next mark
		previous_mark_symbol = "✢", -- Symbol for the previous mark
	},
})

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		vim.cmd("TrailBlazerLoadSession")
	end,
})

-- Force set filetype for .http files on startup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			local bufname = vim.api.nvim_buf_get_name(buf)
			if bufname:match("%.http$") then
				vim.api.nvim_buf_set_option(buf, "filetype", "http")
				vim.cmd("set filetype=http")
			end
		end
	end,
})

-- Ensure .http files always have correct filetype and syntax
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = "*.http",
	callback = function()
		vim.bo.filetype = "http"
		vim.cmd("set filetype=http") -- Explicitly set filetype
		vim.defer_fn(function()
			vim.cmd("runtime syntax/http.vim") -- Load syntax file
			vim.cmd("setlocal syntax=http") -- Ensure syntax highlighting
		end, 100) -- Delay to avoid conflicts with plugins like TrailBlazer
	end,
})
