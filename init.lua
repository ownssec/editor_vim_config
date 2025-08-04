-- Your existing Neovim config

require("plugins")
require("settings")
require("keymap")

local bgColor = "#191616"

-- Function to force background highlights
local function force_bg_highlights()
	vim.cmd("highlight! NvimTreeNormal guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! NvimTreeNormalNC guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! TermNormal guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! TermNormalNC guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! NormalFloat guibg=" .. bgColor .. " guifg=NONE")
end

-- Apply now
force_bg_highlights()

-- Re-apply on ColorScheme change to prevent overrides
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		force_bg_highlights()
	end,
})

vim.lsp.set_log_level("off") -- Disable LSP logging
vim.g.neo_tree_log_to_file = 0 -- Disable NeoTree logs (if using NeoTree)
vim.g.loaded_netrwPlugin = 2 -- Disable file explorer logs (if applicable)

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local log_path = vim.fn.expand(".nvimlog")
		if vim.fn.filereadable(log_path) == 1 then
			os.remove(log_path)
		end
	end,
})



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

  print("--------------Open Buffers-------------------")
  for i, buf in ipairs(buffers) do
    local name = buf.name ~= "" and vim.fn.fnamemodify(buf.name, ":t") or "[No Name]"
    print(i .. "  " .. name)
    buffer_map[tostring(i)] = buf.bufnr
  end
  print("--------------end Buffers--------------------")
end, {})

-- Map number keys 1–9 to switch buffers
for i = 1, 9 do
  vim.keymap.set("n", tostring(i), function()
    local bufnr = buffer_map[tostring(i)]
    if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
      vim.api.nvim_set_current_buf(bufnr)
    else
      vim.cmd("echo 'Invalid buffer or use :Buffer first'")
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


