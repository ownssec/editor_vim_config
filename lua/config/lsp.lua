-- lua/config/lsp.lua
local M = {}

-- ─────────────────────────────────────────────────────────────
-- 1.  Safely load required plugins
-- ─────────────────────────────────────────────────────────────
local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
	vim.notify("Failed to load lspconfig", vim.log.levels.ERROR)
	return M
end

local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp then
	vim.notify("Failed to load cmp_nvim_lsp", vim.log.levels.ERROR)
	return M
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
else
	vim.notify("⚠️ cmp_nvim_lsp not found", vim.log.levels.WARN)
end

-- ─────────────────────────────────────────────────────────────
-- 2.  on_attach & capabilities
-- ─────────────────────────────────────────────────────────────
local on_attach = function(client, bufnr)
	-- Enable built-in omni completion
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Keymaps (buffer-local)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	-- vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
	-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	-- Disable built-in formatting (handled by conform.nvim / null-ls / etc.)
	client.server_capabilities.documentFormattingProvider = false
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- ─────────────────────────────────────────────────────────────
-- 3.  Per-server settings
--     NOTE: use the official IDs from nvim-lspconfig docs
-- ─────────────────────────────────────────────────────────────
local servers = {
	-- JavaScript / TypeScript / React
	tsserver = {
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
		single_file_support = false,
	},

	cssls = {},

	-- Tailwind CSS
	tailwindcss = {
		filetypes = {
			"html",
			"css",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},

	-- Emmet
	-- emmet_ls = {
	-- 	filetypes = {
	-- 		"html",
	-- 		"css",
	-- 		-- "javascript",
	-- 		"javascriptreact",
	-- 		-- "typescript",
	-- 		"typescriptreact",
	-- 	},
	-- 	init_options = {
	-- 		html = { options = { ["bem.enabled"] = true } },
	-- 	},
	-- },

	-- HTML
	html = { filetypes = { "html" } },

	-- Lua (Neovim config)
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = { enable = false },
			},
		},
	},
}

-- ─────────────────────────────────────────────────────────────
-- 4.  Setup each server
-- ─────────────────────────────────────────────────────────────
for name, cfg in pairs(servers) do
	local opts = vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
	}, cfg)

	local ok, err = pcall(function()
		lspconfig[name].setup(opts)
	end)
	if not ok then
		vim.notify("Failed to set up " .. name .. ": " .. err, vim.log.levels.WARN)
	end
end

return M
