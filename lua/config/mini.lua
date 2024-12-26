-- lua/configs/mini.lua

require("mini.pick").setup({

	delay = {
		async = 10,
		busy = 50,
	},

	mappings = {
		caret_left = "<Left>",
		caret_right = "<Right>",

		choose = "<CR>",
		choose_in_split = "<C-s>",
		choose_in_tabpage = "<C-t>",
		choose_in_vsplit = "<C-v>",
		choose_marked = "<M-CR>",

		delete_char = "<BS>",
		delete_char_right = "<Del>",
		delete_left = "<C-u>",
		delete_word = "<C-w>",

		mark = "<C-x>",
		mark_all = "<C-a>",

		move_down = "<C-n>",
		move_start = "<C-g>",
		move_up = "<C-p>",

		paste = "<C-r>",

		refine = "<C-Space>",
		refine_marked = "<M-Space>",

		scroll_down = "<C-f>",
		scroll_left = "<C-h>",
		scroll_right = "<C-l>",
		scroll_up = "<C-b>",

		stop = "<Esc>",

		toggle_info = "<S-Tab>",
		toggle_preview = "<Tab>",
	},

	options = {
		content_from_bottom = false,
		use_cache = false,
	},

	source = {
		items = nil,
		name = nil,
		cwd = nil,

		match = nil,
		show = nil,
		preview = nil,

		choose = nil,
		choose_marked = nil,
	},

	window = {
		config = nil,

		prompt_cursor = "▏",

		prompt_prefix = "> ",

		config = {
			width = 250,
			height = 20,
			border = "single",
			row = vim.o.lines - 0,
			col = 2,
		},
		winblend = 0,
	},
})
require("mini.indentscope").setup({
	draw = {
		delay = 0,
		animation = require("mini.indentscope").gen_animation.linear({ duration = 10 }),
		priority = 2,
	},

	mappings = {
		object_scope = "ii",
		object_scope_with_border = "ai",
		goto_top = "[i",
		goto_bottom = "]i",
	},

	options = {
		border = "both",
		indent_at_cursor = true,
		try_as_border = false,
	},

	symbol = "", --'╎',
})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#473e43" })

vim.api.nvim_set_keymap("n", "<S-p>", '<Cmd>exe ":Pick files"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-o>", '<Cmd>exe ":Pick grep_live"<CR>', { noremap = true, silent = true })
