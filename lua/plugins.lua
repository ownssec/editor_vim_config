-- -- lua/plugins.lua

-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Package Manager
	use("wbthomason/packer.nvim")

	-- Core Utilities
	-- Core Utilities
	-- Core Utilities
	-- Core Utilities
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-web-devicons") -- Icons

	-- LSP and Completion
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		opt = false,
		config = function()
			require("config.cmpconf")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		after = "nvim-cmp",
		config = function()
			require("config.lsp")
		end,
	})

	use("onsails/lspkind-nvim")

	-- Syntax and Language Support
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("config.treesitter")
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascriptreact", "typescriptreact", "javascript", "typescript", "tsx" },
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "javascript", "jsx", "typescript", "tsx", "php" },
			})
		end,
	})

	-- Editing Enhancements
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		config = function()
			require("ultimate-autopair").setup({
				enabled = function()
					local ft = vim.bo.filetype
					return ft == "http" or ft == "json"
				end,
			})
		end,
	})

	-- Git Integration
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns")
		end,
	})
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("config.gitconflict")
		end,
	})

	-- UI and Appearance
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("config.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	-- Colorschemes
	use({
		"zenbones-theme/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			require("config.colorScheme")
		end,
	})

	use({
		"vague2k/vague.nvim",
		config = function()
			require("config.vague")
		end,
	})

	-- Navigation and File Management
	use({
		"nvim-tree/nvim-tree.lua",
		after = "nvim-web-devicons",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("config.nvimtree")
		end,
	})

	-- use({
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.6",
	-- 	requires = { { "nvim-lua/plenary.nvim" } },
	-- 	config = function()
	-- 		require("config.telescope")
	-- 	end,
	-- })

<<<<<<< HEAD
	--fuzzy finder and mini picker
	-- use({
	-- 	"echasnovski/mini.nvim",
	-- 	config = function()
	-- 		require("config.mini")
	-- 	end,
	-- })
=======
	-- use({
	-- 	"nvim-telescope/telescope.nvim",
	-- 	tag = "0.1.6",
	-- 	requires = { { "nvim-lua/plenary.nvim" } },
	-- 	config = function()
	-- 		require("telescope").setup({
	-- 			defaults = {
	-- 				prompt_prefix = "🔍 ",
	-- 				selection_caret = " ",
	-- 				sorting_strategy = "ascending",
	-- 				layout_config = {
	-- 					horizontal = { preview_width = 0.6 },
	-- 				},
	-- 				file_ignore_patterns = { "node_modules", "%.git/" },
	-- 			},
	-- 			pickers = {
	-- 				find_files = {
	-- 					hidden = true,
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		-- Optional: Key mappings
	-- 		local keymap = vim.keymap.set
	-- 		local opts = { noremap = true, silent = true, desc = "" }
	-- 		keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
	-- 		keymap("n", "<C-o>", "<cmd>Telescope live_grep<CR>", { desc = "Live Grep" })
	-- 		-- keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
	-- 		-- keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
	-- 	end,
	-- })

	-- Editing Enhancements
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
>>>>>>> 9d3ab3fd9240d94486bfe3c16279586aed2ad766

	-- Optional, for performance
	-- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- --
	-- -- -- Optional, for file explorer
	-- use({ "nvim-telescope/telescope-file-browser.nvim" })

	use({
		"ggandor/leap.nvim",
		config = function()
			require("config.leap")
		end,
	})

	use({
		"andrewferrier/debugprint.nvim",
		config = function()
			require("config.debugPrint")
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

	-- Command Line
	use("roxma/nvim-yarp")
	use("roxma/vim-hug-neovim-rpc")
	use({
		"gelguy/wilder.nvim",
		config = function()
			require("config.wilder") -- or wherever your config is
		end,
		requires = { "romgrk/fzy-lua-native" }, -- for Lua filters
	})

	-- Cursor Enhancements
	use({
		"sphamba/smear-cursor.nvim",
		config = function()
			require("config.smearCursor")
		end,
	})

	-- Formatters
	use({
		"stevearc/conform.nvim",
		config = function()
			require("config.conform")
		end,
	})

	use({
		"mistweaverco/kulala.nvim",
		config = function()
			require("config.kulala")
		end,
	})

	-- git
	use({
		"tpope/vim-fugitive",
		config = function()

			-- You can put optional config or key mappings here
			--
			-- vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
		end,
	})
end)
