require("trailblazer").setup({
	auto_save_trailblazer_state_on_exit = true,
	auto_load_trailblazer_state_on_enter = true,
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
