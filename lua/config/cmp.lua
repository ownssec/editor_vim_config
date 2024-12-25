-- lua/configs/cmp.lua

local status, cmp = pcall(require, "cmp")
if not status then
	return
end

local lspkind = require("lspkind")

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
})

-- Cmdline completions
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
})

-- local luasnip = require("luasnip")
--
-- luasnip.filetype_extend("javascript", { "html" })
-- luasnip.filetype_extend("javascriptreact", { "html" })
-- luasnip.filetype_extend("typescriptreact", { "html" })
-- luasnip.filetype_extend("html", { "html" })

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
