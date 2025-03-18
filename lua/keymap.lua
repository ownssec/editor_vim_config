-- lua/keymap.lua

vim.o.completeopt = "menu,menuone,noinsert,noselect"

vim.api.nvim_set_keymap("n", "<C-j>", "<C-W>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-W>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-W>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-W>l", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "]t", ":bnext<CR>", { noremap = true, silent = true }) -- Next buffer
vim.api.nvim_set_keymap("n", "[t", ":bprevious<CR>", { noremap = true, silent = true }) -- Previous buffer
vim.api.nvim_set_keymap("n", "[ct", ":%bd|e#|bd#<CR>", { noremap = true, silent = true }) -- Delete all but current buffer

local buf_win_id = nil
local buf_handle = nil

local buf_win_id = nil
local buf_handle = nil

function ToggleBufferList()
	if buf_win_id and vim.api.nvim_win_is_valid(buf_win_id) then
		vim.api.nvim_win_close(buf_win_id, true)
		buf_win_id = nil
		buf_handle = nil
	else
		local buf = vim.api.nvim_create_buf(false, true)
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })

		if #buffers == 0 then
			print("No buffers available")
			return
		end

		local lines = {}
		local keymap = {}
		local keys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "b", "c", "d", "e", "f" }

		for i, b in ipairs(buffers) do
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
		vim.api.nvim_buf_set_keymap(buf, "n", "<CR>", ":lua SelectBuffer()<CR>", { noremap = true, silent = true })
		vim.api.nvim_buf_set_option(buf, "modifiable", false)
		vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	end
end

function SwitchToBuffer(buf_num)
	vim.api.nvim_win_close(buf_win_id, true)
	buf_win_id = nil
	buf_handle = nil
	vim.cmd("buffer " .. buf_num)
end

function SelectBuffer()
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

vim.api.nvim_set_keymap("n", "[e", "<cmd>lua ToggleBufferList()<CR>", { noremap = true, silent = true })
