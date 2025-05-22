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
		"zenbones-theme/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			vim.o.background = "dark"
			vim.cmd("colorscheme neobones") -- Default dark mode

			-- vim.o.guifont = "Iosevka Term:h14"
			--
			-- -- Optional: Customize font/background colors
			vim.api.nvim_set_hl(0, "Normal", { fg = "#F7F7F7", bg = "#041d30" })
			vim.api.nvim_set_hl(0, "Comment", { fg = "#6a737d", italic = true })
			vim.api.nvim_set_hl(0, "String", { fg = "#6a737d" })
			vim.api.nvim_set_hl(0, "Number", { fg = "#F7A072" })
			vim.api.nvim_set_hl(0, "Boolean", { fg = "#dca561" })

            vim.api.nvim_set_hl(0, "Keyword", { fg = "#c18fbe" }) 
            vim.api.nvim_set_hl(0, "Statement", { fg = "#c18fbe" })
			--
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a737d", bg = "#041d30" })
			--
			-- vim.api.nvim_set_hl(0, "Identifier", { fg = "#F7A072" })
			--
			vim.api.nvim_set_hl(0, "Function", { fg = "#AAAE7F" })
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
	-- 		-- leap.preview_filter = false
	--
	-- 		-- Disable default mappings
	-- 		leap.set_default_keymaps(false)
	--
	-- 		-- Set custom mappings
	-- 		-- vim.keymap.set({ "x", "o" }, "f", function()
	-- 		-- 	require("leap.treesitter").select()
	-- 		-- end)
	--
	-- 		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
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
		"leath-dub/snipe.nvim",
		config = function()
			require("snipe").setup({
				ui = {
					---@type integer
					max_height = -1, -- -1 means dynamic height
					-- Where to place the ui window
					-- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
					---@type "topleft"|"bottomleft"|"topright"|"bottomright"|"center"|"cursor"
					position = "topleft",
					-- Override options passed to `nvim_open_win`
					-- Be careful with this as snipe will not validate
					-- anything you override here. See `:h nvim_open_win`
					-- for config options
					---@type vim.api.keyset.win_config
					open_win_override = {
						title = "",
						border = "rounded", -- use "rounded" for rounded border
					},

					-- Preselect the currently open buffer
					---@type boolean
					preselect_current = false,

					-- Set a function to preselect the currently open buffer
					-- E.g, `preselect = require("snipe").preselect_by_classifier("#")` to
					-- preselect alternate buffer (see :h ls and look at the "Indicators")
					---@type nil|fun(buffers: snipe.Buffer[]): number
					preselect = nil, -- function (bs: Buffer[] [see lua/snipe/buffer.lua]) -> int (index)

					-- Changes how the items are aligned: e.g. "<tag> foo    " vs "<tag>    foo"
					-- Can be "left", "right" or "file-first"
					-- NOTE: "file-first" puts the file name first and then the directory name
					---@type "left"|"right"|"file-first"
					text_align = "left",

					-- Provide custom buffer list format
					-- Available options:
					--  "filename" - basename of the buffer
					--  "directory" - buffer parent directory path
					--  "icon" - icon for buffer filetype from "mini.icons" or "nvim-web-devicons"
					--  string - any string, will be inserted as is
					--  fun(buffer_object): string,string - function that takes snipe.Buffer object as an argument
					--    and returns a string to be inserted and optional highlight group name
					-- buffer_format = { "->", "icon", "filename", "", "directory", function(buf)
					--   if vim.fn.isdirectory(vim.api.nvim_buf_get_name(buf.id)) == 1 then
					--     return " ", "SnipeText"
					--   end
					-- end },
				},
				hints = {
					-- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
					---@type string
					dictionary = "1234567890",
				},
				navigate = {
					-- When the list is too long it is split into pages
					-- `[next|prev]_page` options allow you to navigate
					-- this list
					next_page = "J",
					prev_page = "K",

					-- You can also just use normal navigation to go to the item you want
					-- this option just sets the keybind for selecting the item under the
					-- cursor
					under_cursor = "<cr>",

					-- In case you changed your mind, provide a keybind that lets you
					-- cancel the snipe and close the window.
					---@type string|string[]
					cancel_snipe = "<esc>",

					-- Close the buffer under the cursor
					-- Remove "j" and "k" from your dictionary to navigate easier to delete
					-- NOTE: Make sure you don't use the character below on your dictionary
					close_buffer = "D",

					-- Open buffer in vertical split
					open_vsplit = "V",

					-- Open buffer in split, based on `vim.opt.splitbelow`
					open_split = "H",

					-- Change tag manually
					change_tag = "C",
				},
				-- The default sort used for the buffers
				-- Can be any of:
				--  "last" - sort buffers by last accessed
				--  "default" - sort buffers by its number
				--  fun(bs:snipe.Buffer[]):snipe.Buffer[] - custom sort function, should accept a list of snipe.Buffer[] as an argument and return sorted list of snipe.Buffer[]
				sort = "default",
			})
			local snipe = require("snipe")
			snipe.setup()
			vim.keymap.set("n", "t", snipe.open_buffer_menu)
		end,
	})
	-- use({
	-- 	"akinsho/bufferline.nvim",
	-- 	tag = "*", -- specify the tag as '*'
	-- 	config = function()
	-- 		require("config.bufferline")
	-- 	end,
	-- })

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
