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

	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	-- Common utilities
	use("nvim-lua/plenary.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Auto close
	use({
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		config = function()
			require("ultimate-autopair").setup({
				--Config goes here
				enabled = function()
					-- Enable only for .http and .json files
					local ft = vim.bo.filetype
					return ft == "http" or ft == "json"
				end,
			})
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns")
		end,
	})

	-- File tree: nvim-treesitter with TSUpdate
	use({
		"nvim-tree/nvim-tree.lua",
		after = "nvim-web-devicons",
		requires = "nvim-tree/nvim-web-devicons",
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

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("config.toggleterm")
		end,
	})

	-- Statusline
	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		require("config.lualine")
	-- 	end,
	-- 	requires = { "nvim-web-devicons" },
	-- })

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
		"folke/tokyonight.nvim",
		config = function()
			require("config.theme")
		end,
	})

	-- use({
	-- 	"mcchrish/zenbones.nvim",
	-- 	requires = "rktjmp/lush.nvim",
	-- 	config = function()
	-- 		-- vim.o.background = "dark"
	-- 		-- vim.cmd("colorscheme neobones")
	-- 	end,
	-- })

	-- cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		opt = false,
		event = "InsertEnter",
		config = function()
			require("config.cmpconf")
		end,
	})

	-- use({
	-- 	"saghen/blink.cmp",
	-- 	requires = {
	-- 		"rafamadriz/friendly-snippets", -- optional for snippet support
	-- 	},
	-- 	run = function()
	-- 		-- Only required if you're building from source manually (e.g., no prebuilt binary available)
	-- 		-- Uncomment below if you want to force build:
	-- 		-- vim.fn.system { "cargo", "build", "--release" }
	-- 	end,
	-- 	config = function()
	-- 		require("blink.cmp").setup({})
	-- 	end,
	-- })

	use("hrsh7th/cmp-nvim-lsp")
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

	-- formatter
	use({
		"stevearc/conform.nvim",
		config = function()
			require("config.conform")
		end,
	})

	-- http rest
	use({
		"mistweaverco/kulala.nvim",
		config = function()
			require("config.kulala")
		end,
	})

	-- vim motion
	use({
		"rlane/pounce.nvim",
		config = function()
			require("config.pounce")
		end,
	})

	-- cmdline

	use("roxma/nvim-yarp")
	use("roxma/vim-hug-neovim-rpc")

	use({
		"gelguy/wilder.nvim",
		config = function()
			require("config.wilder")
		end,
	})

	-- use({
	-- 	"mhinz/vim-grepper",
	-- 	config = function()
	-- 		require("config.grepper")
	-- 	end,
	-- })

	-- Bufferline.nvim (added plugin)
	use({
		"akinsho/bufferline.nvim",
		tag = "*", -- specify the tag as '*'
		config = function()
			require("config.bufferline")
		end,
	})

	-- cursor
	use({
		"sphamba/smear-cursor.nvim",
		config = function()
			require("smear_cursor").setup({
				cursor_color = "#ffffff", -- Cursor smear color
				normal_bg = "#1e1e2e", -- Background color of your theme
				smear_between_buffers = true, -- Enable smear when switching buffers
				smear_between_neighbor_lines = true, -- Smear on line-to-line movement
				legacy_computing_symbols_support = false, -- Set to true if your font supports legacy block characters
				transparent_bg_fallback_color = "#1e1e2e", -- Fallback for transparent backgrounds
				stiffness = 0.8, -- Smear stiffness
				trailing_stiffness = 0.5, -- Trailing effect stiffness
				trailing_exponent = 0.1, -- Exponent for trail decay
				trailing_stiffness_insert_mode = 0.6,
				distance_stop_animating = 0.5, -- Distance threshold to stop smear
				hide_target_hack = false, -- Hides the target cursor for a smoother smear
				gamma = 1,
			})
		end,
	})

	-- print using js
	use({
		"andrewferrier/debugprint.nvim",
		config = function()
			require("debugprint").setup({
				"andrewferrier/debugprint.nvim",
				opts = {
					keymaps = {
						visual = {
							variable_below = "g?v",
							variable_above = "g?V",
						},
					},
					commands = {
						toggle_comment_debug_prints = "ToggleCommentDebugPrints",
						delete_debug_prints = "DeleteDebugPrints",
						reset_debug_prints_counter = "ResetDebugPrintsCounter",
					},
					-- … Other options
				},
			})
		end,
	})

	--fuzzy finder and mini picker
	use({
		"echasnovski/mini.nvim",
		config = function()
			require("config.mini")
		end,
	})

	--filetree
end)
