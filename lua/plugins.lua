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
			})
		end,
	})
	-- use({
	-- 	"windwp/nvim-ts-autotag",
	-- 	after = "nvim-treesitter",
	-- 	config = function()
	-- 		require("nvim-ts-autotag").setup()
	-- 	end,
	-- })

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

	-- marking instead of bufferline
	use({
		"LeonHeidelbach/trailblazer.nvim",
		config = function()
			require("config.trails")
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
			require("pounce").setup({
				accept_keys = "asdfghjklqwertyuiopzxcvbnm0123456789", -- Keys for jumping
				accept_best_key = "<enter>", -- Automatically jump to best match
				multi_window = true, -- Search across multiple windows
				debug = false,
			})

			-- Keybindings
			vim.api.nvim_set_keymap("n", "f", "<cmd>Pounce<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("v", "f", "<cmd>Pounce<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("o", "f", "<cmd>Pounce<CR>", { noremap = true, silent = true })
		end,
	})

	-- cmdline

	use("roxma/nvim-yarp")
	use("roxma/vim-hug-neovim-rpc")

	use({
		"gelguy/wilder.nvim",
		config = function()
			local wilder = require("wilder")
			-- Initialize Wilder

			wilder.setup({
				modes = { ":", "/", "?" },
				next_key = "<C-n>", -- Move to the next suggestion
				previous_key = "<C-p>", -- Move to the previous suggestion
				accept_key = "<Tab>",
				reject_key = "<C-c>", -- Reject the current suggestion
			})

			-- Set up pipelines
			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.python_file_finder_pipeline({
						file_command = { "find", ".", "-type", "f", "-printf", "%P\n" },
						dir_command = { "find", ".", "-type", "d", "-printf", "%P\n" },
						filters = { "fuzzy_filter", "difflib_sorter" },
					}),
					wilder.cmdline_pipeline({
						language = "python",
						fuzzy = 1,
					}),
					wilder.python_search_pipeline({
						pattern = wilder.python_fuzzy_pattern(),
						sorter = wilder.python_difflib_sorter(),
						process_command = { "rg", "--vimgrep", "--smart-case" }, -- Searches inside files
						engine = "re",
					})
				),
			})

			-- Set up renderer with highlighting
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer({
					highlighter = wilder.basic_highlighter(), -- Enables per-word highlighting
					left = { " ", wilder.popupmenu_devicons() }, -- Adds file-type icons
					right = { " ", wilder.popupmenu_scrollbar() }, -- Adds scrollbar
				})
			)
		end,
	})
end)
