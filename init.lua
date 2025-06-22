-- Your existing Neovim config

require("plugins")
require("settings")
require("keymap")
require("custom")

vim.cmd([[
  let &t_SI = "\e[6 q"  " Insert mode: Blinking bar
  let &t_EI = "\e[2 q"  " Normal mode: Steady block
]])
