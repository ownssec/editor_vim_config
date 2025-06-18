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
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("config.lualine")
		end,
		requires = { "nvim-web-devicons" },
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
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = false, -- don't set background
				-- disable bold/italic globally in `style`
				bold = true,
				italic = true,
				style = {
					-- "none" is the same thing as default. But "italic" and "bold" are also valid options
					boolean = "bold",
					number = "none",
					float = "none",
					error = "bold",
					comments = "italic",
					conditionals = "none",
					functions = "none",
					headings = "bold",
					operators = "none",
					strings = "italic",
					variables = "none",

					-- keywords
					keywords = "none",
					keyword_return = "italic",
					keywords_loop = "none",
					keywords_label = "none",
					keywords_exception = "none",

					-- builtin
					builtin_constants = "bold",
					builtin_functions = "none",
					builtin_types = "bold",
					builtin_variables = "none",
				},
				-- plugin styles where applicable
				-- make an issue/pr if you'd like to see more styling options!
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

				-- Override highlights or add new highlights
				on_highlights = function(highlights, colors) end,

				-- Override colors
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

	use({
		"zenbones-theme/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			local bgColor = "#181818"
			vim.o.background = "dark"
			vim.cmd("colorscheme zenwritten")
			vim.api.nvim_set_hl(0, "Keyword", { fg = "#c18fbe", bold = true })
			vim.api.nvim_set_hl(0, "Statement", { fg = "#c18fbe" })

			vim.api.nvim_set_hl(0, "Normal", { bg = bgColor, fg = "#a3a19e" })
			-- Set relative number background color
			vim.api.nvim_set_hl(0, "LineNr", { bg = bgColor, fg = "#a3a19e" }) -- Example fg color
			vim.api.nvim_set_hl(0, "SignColumn", { bg = bgColor })

			-- Also highlight absolute line number
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = bgColor, fg = "#dedede", bold = true })

			vim.api.nvim_set_hl(0, "String", { fg = "#4aa8bd" })

			-- ===== TERMINAL FIXES =====
			vim.cmd("set termguicolors") -- Enable true colors
			vim.cmd("let &t_ut=''") -- Fix background bleed in terminals
		end,
	})

	-- use({
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("config.theme")
	-- 		-- -- Optional: Customize font/background colors
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
	-- 	tag = "1.*", -- <--- add this line to use prebuilt binaries
	-- 	requires = {
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- 	config = function()
	-- 		require("blink.cmp").setup({
	-- 			fuzzy = {
	-- 				implementation = "lua", -- explicitly use the Lua version
	-- 			},
	-- 		})
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
		"ggandor/leap.nvim",
		config = function()
			local leap = require("leap")

			-- leap.preview_filter = false

			-- Disable default mappings
			leap.set_default_keymaps(false)

			vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
			vim.keymap.set({ "n", "x", "o" }, "f", function()
				leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
			end, { desc = "Leap forward (custom f)" })
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
			vim.o.termguicolors = true
			require("smear_cursor").setup({
				cursor_color = "#ededed",
				speed = 10,
				stiffness = 0.9,
				trailing_stiffness = 0.6,
				stiffness_insert_mode = 0.7,
				time_interval = 8,
				trailing_stiffness_insert_mode = 0.7,
				distance_stop_animating = 0.9,
				trailing_exponent = 6,
				never_draw_over_target = true,
				smear_between_buffers = true,
				smear_between_neighbor_lines = true,
				smear_insert_mode = true,
				hide_target_hack = true,
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

	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Add nvim-ts-autotag
	use({
		"windwp/nvim-ts-autotag",
		ft = { "html", "javascriptreact", "typescriptreact", "javascript", "typescript", "tsx" },
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "javascript", "jsx", "typescript", "tsx", "php" },
			})
		end,
	})

	use({
		"luukvbaal/statuscol.nvim",
		config = function()
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { "%s" }, click = "v:lua.ScSa" },
					{ text = { "%l" }, click = "v:lua.ScLa" },
					{ text = { "  " } },
				},
			})
		end,
	})

	use({
		"tzachar/fuzzy.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		run = "cargo build --release", -- OR use prebuilt binaries, but NOT both
	})

	use({
		"tzachar/cmp-fuzzy-buffer",
		after = { "fuzzy.nvim", "nvim-cmp" },
		config = function()
			require("cmp_fuzzy_buffer").setup()
		end,
	})
end)
