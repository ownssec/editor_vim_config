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
	-- use({
	-- 	"echasnovski/mini.nvim",
	-- 	config = function()
	-- 		require("config.mini")
	-- 	end,
	-- })

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

	-- autosession
	-- use({
	-- 	"rmagatti/auto-session",
	-- 	config = function()
	-- 		require("auto-session").setup({
	-- 			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
	-- 		})
	-- 	end,
	-- })

	use({
		"mhinz/vim-grepper",
		config = function()
			--- GREP
			-- lua
			vim.opt.grepprg = "rg --vimgrep -uu"
			vim.opt.grepformat = "%f:%l:%c:%m"

			-- lua
			-- use <Leader>gg to open quickfix list and Grep for a query

			vim.keymap.set("n", "<C-o>", ":Grepper -highlight<CR>", { noremap = true, silent = true })
			-- vim.keymap.set("n", "<C-e>", ":e ")

			-- use ]q and [q to cycle through quickfix list

			vim.keymap.set("n", "<C-p>", function()
				local qf_info = vim.fn.getqflist({ idx = 0, size = 0 })
				if qf_info.size > 0 and qf_info.idx > 1 then
					vim.cmd("cprev")
				end
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "<C-n>", function()
				local qf_info = vim.fn.getqflist({ idx = 0, size = 0 })
				if qf_info.size > 0 and qf_info.idx < qf_info.size then
					vim.cmd("cnext")
				end
			end, { noremap = true, silent = true })

			vim.api.nvim_create_user_command("Cclose", function()
				vim.cmd("cclose")
				vim.cmd("nohlsearch")
			end, {})

			vim.keymap.set("n", "[s", function()
				local qf_open = false
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "buftype") == "quickfix" then
						qf_open = true
						break
					end
				end

				if qf_open then
					vim.cmd("cclose")
					vim.cmd("nohlsearch") -- Remove search highlight when closing quickfix
				else
					vim.cmd("copen")
				end
			end, { desc = "Toggle Quickfix List and Clear Search Highlight" })
		end,
	})

	-- php
	-- use({
	-- 	"gbprod/phpactor.nvim",
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("phpactor").setup({
	-- 			install = {
	-- 				path = vim.fn.stdpath("data") .. "/phpactor",
	-- 			},
	-- 			lspconfig = {
	-- 				enabled = true,
	-- 			},
	-- 			keymaps = {
	-- 				["gd"] = "definition", -- Go to definition
	-- 				["gr"] = "references", -- Find references
	-- 				["gi"] = "implementation", -- Go to implementation
	-- 				-- ["<leader>rn"] = "rename", -- Rename symbol
	-- 				-- ["<leader>cc"] = "class_new",
	-- 				-- ["<leader>cm"] = "context_menu",
	-- 			},
	-- 		})
	-- 	end,
	-- })
end)
