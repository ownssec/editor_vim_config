require("settings")
require("plugins")
require("keymap")

local themeStatus, kanagawa = pcall(require, "kanagawa")

if themeStatus then
	vim.cmd("colorscheme kanagawa")
else
	return
end
