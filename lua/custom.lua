-- custom.lua

local M = {}
local ns = vim.api.nvim_create_namespace("reltilde_signs")
local sign_name = "RelTildeSign"

-- Define the sign once
vim.fn.sign_define(sign_name, { text = "~", texthl = "LineNr" })

-- Clear all signs
local function clear_signs(buf)
	vim.fn.sign_unplace("reltilde", { buffer = buf })
end

-- Place signs beside every visible line with relative number
function M.update_signs()
	local buf = vim.api.nvim_get_current_buf()
	local win = vim.api.nvim_get_current_win()
	local top = vim.fn.line("w0")
	local bottom = vim.fn.line("w$")
	local cursor = vim.fn.line(".")

	clear_signs(buf)

	for lnum = top, bottom do
		local rel = math.abs(lnum - cursor)
		local txt = "~"
		if rel == 0 then
			txt = "~0"
		else
			txt = "~" .. rel
		end

		local dynamic_name = sign_name .. "_" .. lnum
		vim.fn.sign_define(dynamic_name, { text = txt, texthl = "LineNr" })

		vim.fn.sign_place(0, "reltilde", dynamic_name, buf, { lnum = lnum, priority = 10 })
	end
end

function M.setup()
	vim.api.nvim_create_autocmd({ "CursorMoved", "BufEnter", "WinScrolled" }, {
		callback = function()
			require("custom.reltilde_signs").update_signs()
		end,
	})
end

return M
