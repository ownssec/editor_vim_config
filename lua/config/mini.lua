-- lua/configs/mini.lua
local ui_width = math.floor(vim.o.columns * 1)
local ui_height = math.floor(vim.o.lines * 0.2)

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
		prompt_caret= "▏",

		prompt_prefix = "> ",

		config = {
			-- width = 70,
			-- height = 10,
            width = ui_width,
            height = ui_height,
			-- border = "none",
			border = "rounded",
			row = vim.o.lines - 0,
		},
		-- winhl = "FloatBorder:NormalFloat",
        winhl = "FloatBorder:MiniPickBorder",
		winblend = 0,
		prompt = { anchor = "SW", row = vim.o.lines - 3},
	},
})

-- vim.api.nvim_set_hl(0, "MiniPickBorder", { fg = "#434241", bg = "#434241" })
vim.api.nvim_set_hl(0, "MiniPickBorder", { fg = "#434241"  })

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

	-- symbol = "", --'╎',
	symbol = '╎',
})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#434241" })
-- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#ffffff" })

-- vim.api.nvim_set_keymap("n", "<C-p>", '<Cmd>exe ":Pick files"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-o>", '<Cmd>exe ":Pick grep_live"<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-i>", '<Cmd>exe ":Pick buffers"<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		require("toggleterm").setup({
			float_opts = {
				border = "none",
				width = vim.o.columns,
				height = get_half_screen_height(),
				winblend = 0,
			},
		})
	end,
})
