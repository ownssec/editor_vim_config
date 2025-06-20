-- Your existing Neovim config

require("settings")
require("plugins")
require("keymap")

vim.api.nvim_set_hl(0, "SmearCursor", { fg = "#ffffff", bg = "NONE", blend = 0 })
