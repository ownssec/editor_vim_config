-- lua/configs/mini.lua
local ui_width = math.floor(vim.o.columns * 1)
local ui_height = math.floor(vim.o.lines * 0.2)

-- vim.api.nvim_set_hl(0, "MiniPickBorder", { fg = "#434241", bg = "#434241" })
-- vim.api.nvim_set_hl(0, "MiniPickBorder", { fg = "#434241" })

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

require("mini.files").setup({
	-- Customization of shown content
	content = {
		-- Predicate for which file system entries to show
		filter = nil,
		-- What prefix to show to the left of file system entry
		prefix = nil,
		-- In which order to show file system entries
		sort = nil,
	},

	-- Module mappings created only inside explorer.
	-- Use `''` (empty string) to not create one.
	mappings = {
		close = "q",
		go_in = "l",
		go_in_plus = "L",
		go_out = "h",
		go_out_plus = "H",
		mark_goto = "'",
		mark_set = "m",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},

	-- General options
	options = {
		-- Whether to delete permanently or move into module-specific trash
		permanent_delete = true,
		-- Whether to use for editing directories
		use_as_default_explorer = true,
	},

	-- Customization of explorer windows
	windows = {
		-- Maximum number of windows to show side by side
		max_number = math.huge,
		-- Whether to show preview of file/directory under cursor
		preview = false,
		-- Width of focused window
		width_focus = 50,
		-- Width of non-focused window
		width_nofocus = 15,
		-- Width of preview window
		width_preview = 25,
	},
})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#434241" })
-- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#ffffff" })

-- vim.api.nvim_set_keymap("n", "<C-p>", '<Cmd>exe ":Pick files"<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-E>", '<Cmd>exe ":Pick buffers"<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-o>", '<Cmd>exe ":Pick grep_live"<CR>', { noremap = true, silent = true })

-- vim.keymap.set("n", "<C-e>", function()
-- 	local mini_files = require("mini.files")
--
-- 	-- Check if MiniFiles is open
-- 	if mini_files.close() then
-- 		-- If it was open, close() will return true, so just exit
-- 		return
-- 	end
--
-- 	-- Otherwise, open it
-- 	mini_files.open()
-- end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-e>", function()
	local mini_files = require("mini.files")

	-- If MiniFiles is open, close it
	if mini_files.close() then
		return
	end

	-- Otherwise, open MiniFiles showing current buffer's parent directory
	local buf_path = vim.api.nvim_buf_get_name(0)
	if buf_path == "" then
		-- No file path (e.g., empty buffer) -> fallback to current working dir
		mini_files.open(vim.loop.cwd(), false)
		return
	end

	local parent_dir = vim.fn.fnamemodify(buf_path, ":h")
	mini_files.open(parent_dir, false)

	-- Reveal the file inside MiniFiles
	mini_files.reveal(buf_path, false)
end, { noremap = true, silent = true })
