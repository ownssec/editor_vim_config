-- lua/configs/🌑cmp.lua

-- Attempt to load the 'cmp' module
local status, cmp = pcall(require, "cmp")
if not status then
	return
end

-- Load lspkind for better icons (optional)
local lspkind = require("lspkind")

-- Function to check if there's a word before cursor
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Configure nvim-cmp
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- Use 'luasnip' for snippet expansion
		end,
	},
	mapping = cmp.mapping.preset.insert({
		-- ["<C-j>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
		-- ["<C-k>"] = cmp.mapping.scroll_docs(4),  -- Scroll documentation down
		["<C-e>"] = cmp.mapping.abort(), -- Close completion menu
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		--     if cmp.visible() then
		--         cmp.select_next_item()         -- Select the next item in the list
		--         cmp.confirm({ select = true }) -- Confirm the selection
		--     elseif has_words_before() then
		--         cmp.complete()                 -- Trigger completion
		--     else
		--         fallback()                     -- Default action if no completion
		--     end
		-- end, { "i", "s" }),

		-- Add Ctrl+n and Ctrl+p for navigating completion menu
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text", -- Show symbols + text
			maxwidth = 50, -- Max width for completion items
			ellipsis_char = "...", -- Show "..." for truncated text
		}),
	},
})
-- Cmdline completion
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 		{ name = "cmdline" },
-- 	}, {
-- 		completion = {
-- 			keyword_length = 1, -- Trigger completion after typing the first letter
-- 		},
-- 	}),
-- })

-- Set completion options
vim.o.completeopt = "menuone,noinsert,noselect"

-- Highlight configuration for completion items
vim.api.nvim_set_hl(0, "CmpItemKind", { link = "CmpItemMenuDefault", default = true })

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
