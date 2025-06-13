-- lua/config/lsp.lua
-- local M = {}
--
-- -- Check for required plugins
-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
-- 	vim.notify("Failed to load lspconfig", vim.log.levels.ERROR)
-- 	return M
-- end
--
-- local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not cmp_status_ok then
-- 	vim.notify("Failed to load cmp_nvim_lsp", vim.log.levels.ERROR)
-- 	return M
-- end
--
-- -- Setup keymaps and capabilities
-- local on_attach = function(client, bufnr)
-- 	-- Enable completion triggered by <c-x><c-o>
-- 	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
-- 	-- Mappings
-- 	local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
-- 	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
-- 	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
-- 	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, bufopts)
-- 	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
-- 	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
--
-- 	-- Format on save
-- 	-- if client.supports_method("textDocument/formatting") then
-- 	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
-- 	-- 		buffer = bufnr,
-- 	-- 		callback = function()
-- 	-- 			vim.lsp.buf.format({ async = false })
-- 	-- 		end,
-- 	-- 	})
-- 	-- end
-- 	-- Disable LSP formatting for conform.nvim
-- 	client.server_capabilities.documentFormattingProvider = false
-- end
--
-- local capabilities = cmp_nvim_lsp.default_capabilities()
--
-- -- Language Server Configurations (React-centric)
-- local servers = {
-- 	ts_ls = { -- JavaScript/TypeScript / React
-- 		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
-- 		single_file_support = false,
-- 	},
-- 	eslint = { -- Linting
-- 		root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json"),
-- 		settings = {
-- 			workingDirectory = { mode = "auto" }, -- Important for monorepos or nested configs
-- 		},
-- 	},
-- 	cssls = {}, -- CSS
-- 	tailwindcss = { -- Tailwind CSS
-- 		filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
-- 		init_options = {
-- 			userLanguages = {},
-- 		},
-- 	},
-- 	emmet_ls = { -- Emmet
-- 		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
-- 		init_options = {
-- 			html = {
-- 				options = {
-- 					["bem.enabled"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	html = { -- HTML
-- 		filetypes = { "html" },
-- 	},
-- 	lua_ls = { -- Lua (for Neovim config)
-- 		settings = {
-- 			Lua = {
-- 				diagnostics = { globals = { "vim" } },
-- 				workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
-- 				telemetry = { enable = false },
-- 			},
-- 		},
-- 	},
-- }
--
-- -- Setup servers
-- for server, config in pairs(servers) do
-- 	local setup_opts = vim.tbl_deep_extend("force", {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	}, config)
--
-- 	local ok, _ = pcall(lspconfig[server].setup, setup_opts)
-- 	if not ok then
-- 		vim.notify("Failed to setup " .. server, vim.log.levels.WARN)
-- 	end
-- end
--
-- return M

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

	-- ESLint
	-- eslint = {
	-- 	root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json"),
	-- 	settings = {
	-- 		workingDirectory = { mode = "auto" }, -- monorepo-friendly
	-- 	},
	-- },

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
	emmet_ls = {
		filetypes = {
			"html",
			"css",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		init_options = {
			html = { options = { ["bem.enabled"] = true } },
		},
	},

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
