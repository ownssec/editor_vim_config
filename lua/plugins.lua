-- lua/plugins.lua

-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Common utilities
	use("nvim-lua/plenary.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end,
	})

	-- Git
	-- use({
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		require("config.gitsigns")
	-- 	end,
	-- })

	-- File tree: nvim-treesitter with TSUpdate
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("config.nvimtree")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("config.treesitter")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
	})

	use("onsails/lspkind-nvim")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v<CurrentMajor>.*",
		config = function()
			require("luasnip").setup()
		end,
	})

	-- LSP diagnostics, code actions, and more via Lua.
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("config.null_ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("config.mason")
		end,
	})

	-- Mason: Portable package manager
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("config.toggleterm")
		end,
	})

	--fuzzy finder and mini picker
	use({
		"echasnovski/mini.nvim",
		config = function()
			require("config.mini")
		end,
	})

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("config.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	-- Bufferline.nvim (added plugin)
	use({
		"akinsho/bufferline.nvim",
		tag = "*", -- specify the tag as '*'
		config = function()
			require("config.bufferline")
		end,
	})

	-- Git Conflict plugin
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("config.gitconflict")
		end,
	})

	-- editor Theme
	use({
		"nyoom-engineering/oxocarbon.nvim",
		config = function()
			require("config.editortheme")
		end,
	})

	-- cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("config.cmpconf")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	-- Add cmdline completion
	use({
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
		config = function()
			local cmp = require("cmp")

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
						keyword_length = 1, -- Trigger completion after typing the first letter
					},
				}),
			})
		end,
	})
end)
