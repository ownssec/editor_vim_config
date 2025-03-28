-- lua/buffer.lua
local M = {}

-- State for buffer list window
local state = {
	win_id = nil,
	buf_handle = nil,
	filtered_buffers = {},
	keymap = {
		next = "]b",
		prev = "[b",
		toggle = "<C-[>",
		close_others = "[ct",
	},
}

-- Close buffer list window and clean up
function M.close_buffer_list()
	if state.win_id and vim.api.nvim_win_is_valid(state.win_id) then
		vim.api.nvim_win_close(state.win_id, true)
	end
	state.win_id = nil
	state.buf_handle = nil
	state.filtered_buffers = {}
end

-- Refresh buffer list content
local function refresh_buffer_list()
	if state.win_id and vim.api.nvim_win_is_valid(state.win_id) then
		M.close_buffer_list()
		M.toggle_buffer_list()
	end
end

-- Delete buffer under cursor in buffer list
function M.delete_buffer_under_cursor()
	if not state.buf_handle then
		return
	end

	local line = vim.fn.line(".")
	local buf_info = state.filtered_buffers[line]
	if not buf_info then
		return
	end

	-- Don't delete if it's the last buffer
	if #state.filtered_buffers == 1 then
		vim.notify("Cannot delete the last buffer", vim.log.levels.WARN)
		return
	end

	vim.api.nvim_buf_delete(buf_info.bufnr, { force = true })
	refresh_buffer_list()
end

-- Toggle buffer list window
function M.toggle_buffer_list()
	if state.win_id and vim.api.nvim_win_is_valid(state.win_id) then
		M.close_buffer_list()
		return
	end

	-- Get and filter buffers
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	state.filtered_buffers = vim.tbl_filter(function(b)
		return b.name ~= "kulala://ui"
	end, buffers)

	if #state.filtered_buffers == 0 then
		vim.notify("No buffers available", vim.log.levels.INFO)
		return
	end

	-- Create buffer and window
	state.buf_handle = vim.api.nvim_create_buf(false, true)
	local lines = {}
	local hotkeys =
		{ "1", "2", "3", "4", "q", "w", "e", "a", "s", "c", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p" }

	for i, b in ipairs(state.filtered_buffers) do
		local key = hotkeys[i] or ""
		local buf_name = b.name
		local display_name

		if buf_name ~= "" then
			-- Extract just the filename
			local filename = buf_name:match("([^/\\]+)$") or buf_name
			-- Display as "filename full_path"
			display_name = filename .. " " .. buf_name
		else
			display_name = "[No Name]"
		end

		local entry = string.format("[%s] %d: %s", key, b.bufnr, display_name)
		table.insert(lines, entry)
	end

	vim.api.nvim_buf_set_lines(state.buf_handle, 0, -1, false, lines)

	local width = vim.o.columns
	local height = math.min(math.max(13, #lines), vim.o.lines - 5) -- Ensure it fits on screen
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		row = vim.o.lines - height - 1,
		col = 0,
		style = "minimal",
		border = "none",
	}

	state.win_id = vim.api.nvim_open_win(state.buf_handle, true, opts)

	-- Set buffer options
	vim.api.nvim_buf_set_option(state.buf_handle, "modifiable", false)
	vim.api.nvim_buf_set_option(state.buf_handle, "buftype", "nofile")

	-- Set key mappings
	for i, key in ipairs(hotkeys) do
		if i <= #state.filtered_buffers then
			vim.api.nvim_buf_set_keymap(
				state.buf_handle,
				"n",
				key,
				string.format(
					"<cmd>lua require('buffer_utils').switch_to_buffer(%d)<CR>",
					state.filtered_buffers[i].bufnr
				),
				{ noremap = true, silent = true }
			)
		end
	end

	local mappings = {
		["<CR>"] = "select_buffer_under_cursor()",
		["d"] = "delete_buffer_under_cursor()",
		["<Esc>"] = "close_buffer_list()",
	}

	for key, cmd in pairs(mappings) do
		vim.api.nvim_buf_set_keymap(
			state.buf_handle,
			"n",
			key,
			string.format("<cmd>lua require('buffer_utils').%s<CR>", cmd),
			{ noremap = true, silent = true }
		)
	end
end

-- Switch to specific buffer
function M.switch_to_buffer(buf_num)
	M.close_buffer_list()
	vim.cmd("buffer " .. buf_num)
end

-- Select buffer under cursor in buffer list
function M.select_buffer_under_cursor()
	if not state.buf_handle then
		return
	end

	local line = vim.fn.line(".")
	local content = vim.api.nvim_buf_get_lines(state.buf_handle, line - 1, line, false)[1]
	local buf_num = tonumber(content:match("%[(%w+)%] (%d+):"):match("%d+$"))

	if buf_num then
		M.switch_to_buffer(buf_num)
	end
end

-- Get next valid buffer (skipping kulala://ui)
local function get_next_buffer(current_buf, buffers, direction)
	local step = direction == "next" and 1 or -1
	local start_idx = direction == "next" and 1 or #buffers
	local end_idx = direction == "next" and #buffers or 1

	-- Find current buffer position
	local current_idx
	for i, buf in ipairs(buffers) do
		if buf == current_buf then
			current_idx = i
			break
		end
	end

	if not current_idx then
		return nil
	end

	-- Search in the specified direction
	for i = current_idx + step, end_idx, step do
		local buf = buffers[i]
		if buf and vim.api.nvim_buf_is_valid(buf) then
			local buf_name = vim.api.nvim_buf_get_name(buf)
			if vim.fn.buflisted(buf) == 1 and buf_name ~= "kulala://ui" then
				return buf
			end
		end
	end

	-- Wrap around if needed
	for i = start_idx, end_idx, step do
		local buf = buffers[i]
		if buf and vim.api.nvim_buf_is_valid(buf) and buf ~= current_buf then
			local buf_name = vim.api.nvim_buf_get_name(buf)
			if vim.fn.buflisted(buf) == 1 and buf_name ~= "kulala://ui" then
				return buf
			end
		end
	end

	return nil
end

-- Go to next buffer
function M.bnext()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	local next_buf = get_next_buffer(current_buf, buffers, "next")

	if next_buf then
		vim.api.nvim_set_current_buf(next_buf)
	else
		vim.notify("No other buffers to switch to", vim.log.levels.INFO)
	end
end

-- Go to previous buffer
function M.bprevious()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	local prev_buf = get_next_buffer(current_buf, buffers, "prev")

	if prev_buf then
		vim.api.nvim_set_current_buf(prev_buf)
	else
		vim.notify("No other buffers to switch to", vim.log.levels.INFO)
	end
end

-- Close all buffers except current
function M.close_all_buffers_except_current()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if buf ~= current_buf and vim.api.nvim_buf_is_valid(buf) then
			local buf_name = vim.api.nvim_buf_get_name(buf)
			if vim.fn.buflisted(buf) == 1 and buf_name ~= "kulala://ui" then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end
	end
end

-- Setup key mappings
function M.setup()
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	map("n", state.keymap.toggle, "<cmd>lua require('buffer_utils').toggle_buffer_list()<CR>", opts)
	map("n", state.keymap.next, "<cmd>lua require('buffer_utils').bnext()<CR>", opts)
	map("n", state.keymap.prev, "<cmd>lua require('buffer_utils').bprevious()<CR>", opts)
	map("n", state.keymap.close_others, "<cmd>lua require('buffer_utils').close_all_buffers_except_current()<CR>", opts)
end

return M
