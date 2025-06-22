-- lua/configs/lsp.lua

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Common on_attach function for all LSP servers
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- Safe mappings using vim.keymap.set (avoids E325 crash)
	vim.keymap.set("n", "gd", vim.schedule_wrap(vim.lsp.buf.definition), opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

-- List of servers
local lsp_servers = {
	"tsserver", -- ✅ correct name
	"cssls",
	"tailwindcss",
	"lua_ls",
	"intelephense",
	"jsonls",
	"html",
}

-- Setup loop
for _, server in ipairs(lsp_servers) do
	nvim_lsp[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
