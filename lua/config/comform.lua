-- lua/configs/gitsigns.lua

local status, autopairs = pcall(require, "conform")
if not status then
	return
end

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		php = { "phpcsfixer" },
	},
	format_on_save = {
		timeout_ms = 500, -- Timeout for formatting
		lsp_fallback = true, -- Use LSP formatting if no formatter is defined
	},
})
