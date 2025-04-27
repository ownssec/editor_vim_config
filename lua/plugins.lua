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
	-- use({
	-- 	"mcchrish/zenbones.nvim",
	-- 	requires = "rktjmp/lush.nvim",
	-- 	config = function()
	-- 		vim.o.background = "dark"
	-- 		vim.cmd.colorscheme("kanagawabones")
	--
	-- 		-- Softer off-white foreground
	-- 		-- local soft_white = "#e0e0e0"
	-- 		-- local bg = "#1b1b1b"
	-- 		--
	-- 		-- vim.api.nvim_set_hl(0, "Normal", { fg = soft_white, bg = bg })
	-- 		-- vim.api.nvim_set_hl(0, "Comment", { fg = "#a0a0a0", italic = true })
	-- 		-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" })
	-- 		-- vim.api.nvim_set_hl(0, "Visual", { bg = "#44475a" })
	-- 		-- vim.api.nvim_set_hl(0, "LineNr", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "StatusLine", { fg = soft_white, bg = "#303030" })
	-- 		-- vim.api.nvim_set_hl(0, "VertSplit", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "Title", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "Function", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "String", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "Keyword", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "Type", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "Identifier", { fg = soft_white })
	-- 		-- vim.api.nvim_set_hl(0, "Constant", { fg = soft_white })
	-- 	end,
	-- })

	-- use({
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("config.theme")
	-- 	end,
	-- })

	use({
		"metalelf0/black-metal-theme-neovim",
		config = function()
			require("black-metal").setup({
				-- optional configuration here
				theme = "taake",
			})
			require("black-metal").load()

			vim.api.nvim_set_hl(0, "Normal", { bg = "#1f1f1f" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1f1f1f" })

			-- -- Make sure cursorline is enabled
			-- vim.o.cursorline = true
			--
			-- -- Now really change the full cursor line color
			-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222244" }) -- ← change row color to dark blue
			-- vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#222244", fg = "#ff8800" }) -- line number too (optional)
			--
			-- -- (optional) change Visual mode selection
			-- -- Now really change the full cursor line color
			-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222244" })

			local background_color = "#0a0a1a" -- dark navy background
			local cursorline_color = "#222244" -- current line background
			local visual_color = "#444466" -- selection
			local number_fg_color = "#888888" -- GRAY color for all numbers

			-- Backgrounds
			vim.api.nvim_set_hl(0, "Normal", { bg = background_color })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = background_color })

			-- Cursorline
			vim.api.nvim_set_hl(0, "CursorLine", { bg = cursorline_color })
			vim.api.nvim_set_hl(0, "CursorLineNr", { bg = cursorline_color, fg = "#ff8800", bold = true })

			-- Visual select
			vim.api.nvim_set_hl(0, "Visual", { bg = visual_color })

			-- Line Numbers (all gray)
			vim.api.nvim_set_hl(0, "LineNr", { bg = background_color, fg = number_fg_color }) -- normal numbers
			vim.api.nvim_set_hl(0, "LineNrAbove", { bg = background_color, fg = number_fg_color }) -- relative above
			vim.api.nvim_set_hl(0, "LineNrBelow", { bg = background_color, fg = number_fg_color }) -- relative below

			-- Sign column
			vim.api.nvim_set_hl(0, "SignColumn", { bg = background_color })

			-- Splits, Statuslines
			vim.api.nvim_set_hl(0, "VertSplit", { bg = background_color, fg = "#444455" })
			vim.api.nvim_set_hl(0, "StatusLine", { bg = background_color, fg = "#aaaaaa" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { bg = background_color, fg = "#777777" })
			vim.api.nvim_set_hl(0, "WinSeparator", { bg = background_color, fg = "#444455" })

			-- End of buffer clean
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = background_color, fg = background_color })
			vim.api.nvim_set_hl(0, "FloatNormal", { bg = background_color })

			-- Hide ~ symbols
			vim.opt.fillchars = {
				eob = "~", -- EOB = End Of Buffer character
				vert = "│", -- optional, for splits
			}

			-- (optional) change Visual mode selection
			-- vim.api.nvim_set_hl(0, "Visual", { bg = "#444466" })
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

	-- use({
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		local leap = require("leap")
	--
	-- 		-- Disable default mappings
	-- 		leap.set_default_keymaps(false)
	--
	-- 		-- Set custom mappings
	-- 		vim.keymap.set({ "n", "x", "o" }, "f", function()
	-- 			leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
	-- 		end, { desc = "Leap forward (custom f)" })
	-- 	end,
	-- })

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
