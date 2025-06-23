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
		-- event = "InsertEnter",
		config = function()
			require("config.cmpconf")
		end,
	})

	-- use("hrsh7th/cmp-nvim-lsp")
	-- use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	-- use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({
		"neovim/nvim-lspconfig",
		after = "nvim-cmp",
		config = function()
			require("config.lsp")
		end,
	})
	-- use("saadparwaiz1/cmp_luasnip")

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

	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		config = function()
			require("config.bufferline")
		end,
	})

	-- use({
	-- 	"luukvbaal/statuscol.nvim",
	-- 	config = function()
	-- 		require("statuscol").setup({
	-- 			relculright = true,
	-- 			segments = {
	-- 				{ text = { "`%s" } },
	-- 				{ text = { "%l" } },
	-- 				{ text = { " " } },
	-- 				-- fillcharhl = true,
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- Colorschemes
	use({
		"zenbones-theme/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			local bgColor = "#181818"
			local fgImportant = "#c18fbe"
			vim.o.background = "dark"

			vim.cmd.colorscheme("zenwritten")

			vim.api.nvim_set_hl(0, "Keyword", { fg = fgImportant, bold = true })
			vim.api.nvim_set_hl(0, "Statement", { fg = fgImportant })
			vim.api.nvim_set_hl(0, "Normal", { bg = bgColor, fg = "#a3a19e" })
			vim.api.nvim_set_hl(0, "LineNr", { bg = bgColor, fg = "#a3a19e" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = bgColor })
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = bgColor, fg = "#dedede", bold = true })
			vim.api.nvim_set_hl(0, "String", { fg = "#547d87" })

			-- For init.lua
			vim.opt.guicursor = "n-v-c:block-Cursor"
			vim.api.nvim_set_hl(0, "Cursor", { fg = "#FFFFFF", bg = "#FFFFFF" })
		end,
	})

	use({
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = false,
				bold = true,
				italic = true,
				style = {
					boolean = "bold",
					number = "bold",
					float = "none",
					error = "bold",
					comments = "italic",
					conditionals = "none",
					functions = "bold",
					headings = "bold",
					operators = "none",
					strings = "italic",
					variables = "none",
					keywords = "none",
					keyword_return = "italic",
					keywords_loop = "none",
					keywords_label = "none",
					keywords_exception = "none",
					builtin_constants = "bold",
					builtin_functions = "none",
					builtin_types = "bold",
					builtin_variables = "none",
				},
				plugins = {
					cmp = {
						match = "bold",
						match_fuzzy = "bold",
					},
					dashboard = {
						footer = "italic",
					},
					lsp = {
						diagnostic_error = "bold",
						diagnostic_hint = "none",
						diagnostic_info = "italic",
						diagnostic_ok = "none",
						diagnostic_warn = "bold",
					},
					neotest = {
						focused = "bold",
						adapter_name = "bold",
					},
					telescope = {
						match = "bold",
					},
				},
				colors = {
					bg = "#181818",
					fg = "#cdcdcd",
					floatBorder = "#878787",
					line = "#252530",
					comment = "#606079",
					builtin = "#b4d4cf",
					func = "#c48282",
					string = "#e8b589",
					number = "#e0a363",
					property = "#c3c3d5",
					constant = "#aeaed1",
					parameter = "#bb9dbd",
					visual = "#333738",
					error = "#d8647e",
					warning = "#f3be7c",
					hint = "#7e98e8",
					operator = "#90a0b5",
					keyword = "#6e94b2",
					type = "#9bb4bc",
					search = "#405065",
					plus = "#7fa563",
					delta = "#f3be7c",
				},
			})
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

	use({
		"echasnovski/mini.nvim",
		config = function()
			require("config.mini")
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

	use({
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")
			leap.set_default_keymaps(false)
			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
			vim.keymap.set({ "n", "x", "o" }, "f", function()
				leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
			end, { desc = "Leap forward (custom f)" })
		end,
	})

	use({
		"andrewferrier/debugprint.nvim",
		config = function()
			require("debugprint").setup({
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
				},
			})
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
			require("config.wilder")
		end,
	})

	-- Cursor Enhancements
	use({
		"sphamba/smear-cursor.nvim",
		config = function()
			vim.o.guicursor = table.concat({
				"n-v-c:block",
				"i-ci-ve:ver25",
				"r-cr:hor20",
				"o:hor50",
				"sm:block-blinkwait175-blinkon150-blinkoff150",
			}, ",")

			require("smear_cursor").setup({
				-- never_draw_over_target = true,
				smear_between_buffers = true,
				smear_between_neighbor_lines = true,
				smear_insert_mode = true,
				stiffness = 0.9, -- 0.65     [0, 1]
				trailing_stiffness = 0.7, -- 0.5      [0, 1]
				stiffness_insert_mode = 0.8, -- 0.6      [0, 1]
				trailing_stiffness_insert_mode = 0.8, -- 0.6      [0, 1]
				damping = 0.65, -- 0.6      [0, 1]
				-- distance_stop_animating = 0.1,
				-- time_interval = 7,
				cursor_color = "#8c8888",
				-- damping = 0.5,
				-- never_draw_over_target = true,
				-- hide_target_hack = true,
				gamma = 1,
			})
		end,
	})

	-- Formatters
	use({
		"stevearc/conform.nvim",
		config = function()
			require("config.conform")
		end,
	})

	-- HTTP Requests
	use({
		"mistweaverco/kulala.nvim",
		config = function()
			require("config.kulala")
		end,
	})
end)
