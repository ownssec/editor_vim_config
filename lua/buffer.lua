-- lua/buffer.lua

vim.api.nvim_set_keymap("n", "[e", "<cmd>lua ToggleBufferList()<CR>", { noremap = true, silent = true }) -- Map [e to toggle the buffer list
-- Map custom bnext and bprevious to keybindings
vim.api.nvim_set_keymap("n", "]t", ":lua BNext()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[t", ":lua BPrevious()<CR>", { noremap = true, silent = true })

-- Delete all buffers except the current one
function CloseAllBuffersExceptCurrent()
	local current_buf = vim.api.nvim_get_current_buf() -- Get the current buffer
	local buffers = vim.api.nvim_list_bufs() -- Get a list of all buffers

	for _, buf in ipairs(buffers) do
		-- Skip the current buffer and unlisted buffers (e.g., help, quickfix, etc.)
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1 then
			vim.api.nvim_buf_delete(buf, { force = true }) -- Force delete the buffer
		end
	end
end

-- Map [ct to delete all buffers except the current one
vim.api.nvim_set_keymap("n", "[ct", ":lua CloseAllBuffersExceptCurrent()<CR>", { noremap = true, silent = true })

-- Variables to track the buffer list window and buffer
local buf_win_id = nil
local buf_handle = nil

-- Function to close the buffer list window and reset state
function CloseBufferList()
	if buf_win_id and vim.api.nvim_win_is_valid(buf_win_id) then
		vim.api.nvim_win_close(buf_win_id, true)
	end
	buf_win_id = nil
	buf_handle = nil
end

-- Function to toggle the buffer list
function ToggleBufferList()
	if buf_win_id and vim.api.nvim_win_is_valid(buf_win_id) then
		CloseBufferList()
	else
		local buf = vim.api.nvim_create_buf(false, true)
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })

		-- Filter out buffers with the name "kulala://ui"
		local filtered_buffers = {}
		for _, b in ipairs(buffers) do
			if b.name ~= "kulala://ui" then
				table.insert(filtered_buffers, b)
			end
		end

		if #filtered_buffers == 0 then
			print("No buffers available")
			return
		end

		local lines = {}
		local keymap = {}
		local keys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f" }

		for i, b in ipairs(filtered_buffers) do
			local key = keys[i] or ""
			local entry = string.format("[%s] %d: %s", key, b.bufnr, b.name ~= "" and b.name or "[No Name]")
			table.insert(lines, entry)
			keymap[key] = b.bufnr
		end

		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

		local width = vim.o.columns
		local height = math.max(13, #lines)
		local opts = {
			relative = "editor",
			width = width,
			height = height,
			row = vim.o.lines - height - 1,
			col = 0,
			style = "minimal",
			border = "none",
		}

		buf_win_id = vim.api.nvim_open_win(buf, true, opts)
		buf_handle = buf

		-- Set mappings for hotkeys
		for key, bufnr in pairs(keymap) do
			vim.api.nvim_buf_set_keymap(
				buf,
				"n",
				key,
				string.format(":lua SwitchToBuffer(%d)<CR>", bufnr),
				{ noremap = true, silent = true }
			)
		end

		-- Enable Enter key to select a buffer
		vim.api.nvim_buf_set_keymap(
			buf,
			"n",
			"<CR>",
			":lua SelectBufferUnderCursor()<CR>",
			{ noremap = true, silent = true }
		)

		-- Enable Escape key to close the buffer list
		vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":lua CloseBufferList()<CR>", { noremap = true, silent = true })

		vim.api.nvim_buf_set_option(buf, "modifiable", false)
		vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	end
end

-- Function to switch to a specific buffer
function SwitchToBuffer(buf_num)
	CloseBufferList()
	vim.cmd("buffer " .. buf_num)
end

-- Function to select the buffer under the cursor
function SelectBufferUnderCursor()
	if not buf_handle then
		return
	end

	local line = vim.fn.line(".")
	local content = vim.api.nvim_buf_get_lines(buf_handle, line - 1, line, false)[1]
	local buf_num = tonumber(content:match("%d+"))

	if buf_num then
		SwitchToBuffer(buf_num)
	end
end

-- Function to go to the next buffer, skipping "kulala://ui"
function BNext()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	local next_buf = nil

	-- Find the next buffer after the current one
	for i, buf in ipairs(buffers) do
		if buf == current_buf then
			-- Start searching from the next buffer
			for j = i + 1, #buffers do
				local buf_name = vim.api.nvim_buf_get_name(buffers[j])
				if
					vim.api.nvim_buf_is_loaded(buffers[j])
					and vim.fn.buflisted(buffers[j]) == 1
					and buf_name ~= "kulala://ui"
				then
					next_buf = buffers[j]
					break
				end
			end
			break
		end
	end

	-- If no next buffer is found, wrap around to the first buffer
	if not next_buf then
		for _, buf in ipairs(buffers) do
			local buf_name = vim.api.nvim_buf_get_name(buf)
			if vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) == 1 and buf_name ~= "kulala://ui" then
				next_buf = buf
				break
			end
		end
	end

	if next_buf then
		vim.api.nvim_set_current_buf(next_buf)
	else
		print("No other buffers to switch to")
	end
end

-- Function to go to the previous buffer, skipping "kulala://ui"
function BPrevious()
	local current_buf = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()
	local prev_buf = nil

	-- Find the previous buffer before the current one
	for i, buf in ipairs(buffers) do
		if buf == current_buf then
			-- Start searching from the previous buffer
			for j = i - 1, 1, -1 do
				local buf_name = vim.api.nvim_buf_get_name(buffers[j])
				if
					vim.api.nvim_buf_is_loaded(buffers[j])
					and vim.fn.buflisted(buffers[j]) == 1
					and buf_name ~= "kulala://ui"
				then
					prev_buf = buffers[j]
					break
				end
			end
			break
		end
	end

	-- If no previous buffer is found, wrap around to the last buffer
	if not prev_buf then
		for i = #buffers, 1, -1 do
			local buf_name = vim.api.nvim_buf_get_name(buffers[i])
			if
				vim.api.nvim_buf_is_loaded(buffers[i])
				and vim.fn.buflisted(buffers[i]) == 1
				and buf_name ~= "kulala://ui"
			then
				prev_buf = buffers[i]
				break
			end
		end
	end

	if prev_buf then
		vim.api.nvim_set_current_buf(prev_buf)
	else
		print("No other buffers to switch to")
	end
end
