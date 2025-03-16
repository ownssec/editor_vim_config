-- lua/configs/grepper.lua

--- GREP
-- lua
vim.opt.grepprg = "rg --vimgrep -uu"
vim.opt.grepformat = "%f:%l:%c:%m"

-- lua
-- use <Leader>gg to open quickfix list and Grep for a query

vim.keymap.set("n", "<C-o>", ":Grepper -highlight<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-e>", ":e ")

-- use ]q and [q to cycle through quickfix list

vim.keymap.set("n", "<C-p>", function()
	local qf_info = vim.fn.getqflist({ idx = 0, size = 0 })
	if qf_info.size > 0 and qf_info.idx > 1 then
		vim.cmd("cprev")
	end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-n>", function()
	local qf_info = vim.fn.getqflist({ idx = 0, size = 0 })
	if qf_info.size > 0 and qf_info.idx < qf_info.size then
		vim.cmd("cnext")
	end
end, { noremap = true, silent = true })

vim.api.nvim_create_user_command("Cclose", function()
	vim.cmd("cclose")
	vim.cmd("nohlsearch")
end, {})

vim.keymap.set("n", "[s", function()
	local qf_open = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "buftype") == "quickfix" then
			qf_open = true
			break
		end
	end

	if qf_open then
		vim.cmd("cclose")
		vim.cmd("nohlsearch") -- Remove search highlight when closing quickfix
	else
		vim.cmd("copen")
	end
end, { desc = "Toggle Quickfix List and Clear Search Highlight" })
