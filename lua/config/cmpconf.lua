-- lua/configs/🌑cmp.lua

-- Attempt to load the 'cmp' module
local status, cmp = pcall(require, "cmp")
if not status then
	return
end

-- Load lspkind for better icons (optional)
local lspkind = require("lspkind")

-- Configure nvim-cmp
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- Use 'luasnip' for snippet expansion
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-e>"] = cmp.mapping.abort(), -- Close completion menu
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
	}),

	sources = cmp.config.sources({
		{ name = "blink" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),

	formatting = {
		format = function(entry, vim_item)
			vim_item = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
			})(entry, vim_item)

			if entry.source.name == "blink" then
				vim_item.kind = "🧠 [Blink]"
			end
			return vim_item
		end,
	},
	-- sources = cmp.config.sources({
	-- 	{ name = "nvim_lsp" },
	-- 	{ name = "luasnip" },
	-- 	{ name = "buffer" },
	-- 	{ name = "path" },
	-- }),
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		mode = "symbol_text", -- Show symbols + text
	-- 		maxwidth = 50, -- Max width for completion items
	-- 		ellipsis_char = "...", -- Show "..." for truncated text
	-- 	}),
	-- },
})
-- Set completion options
vim.o.completeopt = "menuone,noinsert,noselect"

-- Highlight configuration for completion items
vim.api.nvim_set_hl(0, "CmpItemKind", { link = "CmpItemMenuDefault", default = true })

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
