-- lua/configs/🌑cmp.lua

-- Attempt to load the 'cmp' module
local status, cmp = pcall(require, "cmp")
if not status then
    return
end

-- Load the 'lspkind' module for icons (optional)
local lspkind = require("lspkind")

-- Configure nvim-cmp
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Use 'luasnip' for snippet expansion
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation up
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Scroll documentation down
        ["<C-Space>"] = cmp.mapping.complete(),  -- Trigger completion menu
        ["<C-e>"] = cmp.mapping.close(),         -- Close completion menu
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP completions
        { name = "buffer" },   -- Buffer completions
    }),
})

cmp.event:on("confirm_done")

-- Cmdline completion
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }, -- Suggest from the buffer in search mode
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
    }, {
        { name = "cmdline", keyword_length = 1 }, -- Suggest commands in cmdline mode
        completion = {
            keyword_length = 1,                   -- Trigger completion after typing the first letter
        },
    }),
})

-- Set completion options
vim.o.completeopt = "menuone,noinsert,noselect"

-- Highlight configuration for completion items
vim.api.nvim_set_hl(0, "CmpItemKind", { link = "CmpItemMenuDefault", default = true })

vim.cmd([[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]])
