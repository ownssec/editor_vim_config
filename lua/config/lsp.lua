-- lua/configs/lsp.lua

-- local status, nvim_lsp = pcall(require, "lspconfig")
-- if not status then
-- 	return
-- end
--
-- require("vim.lsp.protocol")
--
-- -- Common on_attach function for all LSP servers
-- local on_attach = function(client, bufnr)
-- 	-- LSP keymaps
-- 	local function buf_set_keymap(...)
-- 		vim.api.nvim_buf_set_keymap(bufnr, ...)
-- 	end
-- 	local opts = { noremap = true, silent = true }
--
-- 	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- end
--
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- -- Ensure LSP servers are installed before attempting setup
-- local lsp_servers = {
-- 	"ts_ls", -- JavaScript/TypeScript LSP (corrected from "ts_ls")
-- 	"cssls", -- CSS LSP
-- 	"tailwindcss", -- Tailwind CSS LSP
-- 	"lua_ls", -- Lua LSP (for Neovim config)
-- 	"intelephense", -- PHP LSP (Laravel)
-- 	"jsonls", -- JSON LSP
-- 	"html", -- JSON LSP
-- }
--
-- for _, server in ipairs(lsp_servers) do
-- 	nvim_lsp[server].setup({
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	})
-- end

-- local status, nvim_lsp = pcall(require, "lspconfig")
-- if not status then
-- 	return
-- end
--
-- local on_attach = function(client, bufnr)
-- 	local function buf_set_keymap(...)
-- 		vim.api.nvim_buf_set_keymap(bufnr, ...)
-- 	end
-- 	local opts = { noremap = true, silent = true }
--
-- 	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- end
--
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- local lsp_servers = {
-- 	"ts_ls",
-- 	"cssls",
-- 	"tailwindcss",
-- 	"lua_ls",
-- 	"intelephense",
-- 	"jsonls",
-- 	"html",
-- }
--
-- for _, server in ipairs(lsp_servers) do
-- 	local lsp = nvim_lsp[server]
-- 	if lsp then
-- 		local opts = {
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 		}
-- 		if server == "lua_ls" then
-- 			opts.settings = {
-- 				Lua = {
-- 					diagnostics = { globals = { "vim" } },
-- 					workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
-- 					telemetry = { enable = false },
-- 				},
-- 			}
-- 		elseif server == "emmet_ls" then
-- 			opts.filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" }
-- 		end
-- 		lsp.setup(opts)
-- 	else
-- 		vim.notify("[LSP] Server not found: " .. server, vim.log.levels.WARN)
-- 	end
-- end
--
-- -- Setup emmet_ls manually (not in nvim-lspconfig by default)
-- nvim_lsp.emmet_ls = {
-- 	default_config = {
-- 		cmd = { "emmet-ls", "--stdio" },
-- 		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
-- 		root_dir = function(fname)
-- 			return vim.loop.cwd()
-- 		end,
-- 		settings = {},
-- 	},
-- }
--
-- nvim_lsp.emmet_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
-- })

-- lua/config/lsp.lua
local M = {}

-- Check for required plugins
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("Failed to load lspconfig", vim.log.levels.ERROR)
	return M
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
	vim.notify("Failed to load cmp_nvim_lsp", vim.log.levels.ERROR)
	return M
end

-- Setup keymaps and capabilities
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

	-- Format on save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Language Server Configurations (React-centric)
local servers = {
	ts_ls = { -- JavaScript/TypeScript / React
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
		single_file_support = false,
	},
	eslint = { -- Linting
		root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json"),
	},
	cssls = {}, -- CSS
	tailwindcss = { -- Tailwind CSS
		filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
		init_options = {
			userLanguages = {},
		},
	},
	emmet_ls = { -- Emmet
		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
		init_options = {
			html = {
				options = {
					["bem.enabled"] = true,
				},
			},
		},
	},
	html = { -- HTML
		filetypes = { "html" },
	},
	lua_ls = { -- Lua (for Neovim config)
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	},
}

-- Setup servers
for server, config in pairs(servers) do
	local setup_opts = vim.tbl_deep_extend("force", {
		on_attach = on_attach,
		capabilities = capabilities,
	}, config)

	local ok, _ = pcall(lspconfig[server].setup, setup_opts)
	if not ok then
		vim.notify("Failed to setup " .. server, vim.log.levels.WARN)
	end
end

return M
