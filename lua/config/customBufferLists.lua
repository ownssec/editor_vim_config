-- bufferlist.lua

-- Store the current list of buffers with order
local buffer_map = {}

-- Command to show numbered buffer list
vim.api.nvim_create_user_command("Buffer", function()
  buffer_map = {}  -- Reset previous list
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })

  if #buffers == 0 then
    print("No open buffers.")
    return
  end

  print(" ")


for i, buf in ipairs(buffers) do
  local fullpath = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":p") or nil
  local display_path

  if fullpath then
    local relative_path = vim.fn.fnamemodify(fullpath, ":~:.")
    local parts = vim.split(relative_path, "/")
    local start_index = math.max(1, #parts - 2)
    display_path = table.concat(parts, "/", start_index)
  else
    display_path = "[No Name]"
  end

  print(i .. " " .. display_path)
  buffer_map[tostring(i)] = buf.bufnr
end
  print(" ")
end, {})

-- Map number keys 1–9 to switch buffers

for i = 1, 9 do
  vim.keymap.set("n", tostring(i), function()
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local bufnr = buffers[i] and buffers[i].bufnr
    if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
      vim.api.nvim_set_current_buf(bufnr)
    else
      vim.cmd("echo 'Invalid buffer number'")
    end
  end, { noremap = true, silent = true, desc = "Switch to buffer " .. i })
end


-- Optional: Show buffer list with <C-i>
vim.keymap.set("n", "<C-i>", ":Buffer<CR>", { noremap = true, silent = true, desc = "Show buffer list" })

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


