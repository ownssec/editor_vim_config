-- Your existing Neovim config

require("plugins")
require("settings")
require("keymap")
require("custom")

local bg = "#191616"

-- Function to force background highlights
local function force_bg_highlights()
	vim.cmd("highlight! NvimTreeNormal guibg=" .. bg .. " guifg=NONE")
	vim.cmd("highlight! NvimTreeNormalNC guibg=" .. bg .. " guifg=NONE")
	vim.cmd("highlight! TermNormal guibg=" .. bg .. " guifg=NONE")
	vim.cmd("highlight! TermNormalNC guibg=" .. bg .. " guifg=NONE")
	vim.cmd("highlight! NormalFloat guibg=" .. bg .. " guifg=NONE")
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
