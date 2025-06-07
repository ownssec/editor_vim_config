-- lua/settings.lua

local global = vim.g
local o = vim.o

vim.scriptencoding = "utf-8"

-- Map <leader>

global.mapleader = " "
global.maplocalleader = " "

-- Editor options

o.number = true -- Print the line number in front of each line
o.relativenumber = true -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
o.syntax = "on" -- When this option is set, the syntax with this name is loaded.
o.autoindent = true -- Copy indent from current line when starting a new line.
o.cursorline = true -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
o.encoding = "utf-8" -- Sets the character encoding used inside Vim.
o.fileencoding = "utf-8" -- Sets the character encoding for the file of this buffer.
o.ruler = true -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a" -- Enable the use of the mouse. "a" you can use on all modes
o.title = true -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.smartindent = true -- set smartindent
o.history = 5000 -- set history=5000

-- Set options
o.scl = "no" -- set scl=no
o.modifiable = true -- set modifiable
o.hlsearch = false
o.showtabline = 0 -- set showtabline=0
o.incsearch = true -- set incsearch

-- Additional options
o.updatetime = 300 -- set updatetime=300
o.termguicolors = true -- set termguicolors
o.ignorecase = true -- set ignorecase
o.smartcase = true -- set smartcase
o.compatible = false -- set nocompatible
o.splitright = true

o.signcolumn = "yes" -- Ensure the sign column is always visible
o.shadafile =
	-- remove hotkey alt + `
	vim.keymap.set({ "n", "v", "t" }, "<A-`>", "<Nop>", { noremap = true, silent = true })

-- Add recursive search to the 'path'
-- vim.opt.path:append(vim.fn.fnamemodify(vim.loop.cwd(), ":h") .. "/**")
-- Enable search for hidden files
-- vim.opt.wildignore:append(".git,.cache,node_modules")

-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		vim.opt.statuscolumn =
-- 			"%s%=%{v:lnum == line('.') ? printf('~ %d', v:lnum) : printf('%d', abs(v:lnum - line('.')))}"
-- 		vim.cmd("highlight EndOfBuffer guifg=Grey")
-- 	end,
-- })

-- vim.opt.background = "dark"
-- vim.cmd("hi clear")
--
-- if vim.fn.exists("syntax_on") == 1 then
-- 	vim.cmd("syntax reset")
-- end
--
-- vim.g.colors_name = "custom"
--
-- local hl = vim.api.nvim_set_hl
--
-- -- Highlight groups
-- hl(0, "Normal", { fg = "#FEFEFE", bg = "#202020" })
-- hl(0, "NormalFloat", { fg = "#FEFEFE", bg = "#202020" })
-- hl(0, "Comment", { fg = "#6f7b68" })
-- hl(0, "TSComment", { fg = "#6f7b68" })
-- hl(0, "Conceal", { bg = "#262626" })
-- hl(0, "Constant", { fg = "#cccccc" })
-- hl(0, "DiffAdd", { fg = "#FFFEDB", bg = "#2B3328" })
-- hl(0, "DiffChange", { fg = "#FFFEDB", bg = "#262636" })
-- hl(0, "DiffDelete", { fg = "#C34143", bg = "#42242B" })
-- hl(0, "DiffText", { fg = "#FFFEDB", bg = "#49443C" })
-- hl(0, "Directory", { fg = "#C1C88D" })
-- hl(0, "Error", { fg = "#FFFEDB", undercurl = true })
-- hl(0, "ErrorMsg", { fg = "#FFFEDB" })
-- hl(0, "Function", { fg = "#AA9AAC" })
-- hl(0, "Identifier", { fg = "#8B9698" })
-- hl(0, "LineNr", { fg = "#d6d2c8" })
-- hl(0, "LineNrAbove", { fg = "#888888", bg = "#222222" })
-- hl(0, "LineNrBelow", { fg = "#888888", bg = "#222222" })
-- hl(0, "MatchParen", { fg = "#FFFEDB" })
-- hl(0, "NonText", { fg = "#303030" })
-- hl(0, "Operator", { fg = "#DEBF7C" })
-- hl(0, "Pmenu", { fg = "#918988", bg = "#303030" })
-- hl(0, "PmenuSbar", { fg = "#918988", bg = "#262626" })
-- hl(0, "PmenuSel", { fg = "#BFBBBA", bg = "#303030" })
-- hl(0, "PmenuThumb", { fg = "#918988", bg = "#262626", reverse = true })
-- hl(0, "PreProc", { fg = "#8B9698" })
-- hl(0, "Question", { fg = "#9b8d7f" })
-- hl(0, "QuickFixLine", { bg = "#303030" })
-- hl(0, "Search", { bg = "#5F5958" })
-- hl(0, "Special", { fg = "#cccccc" })
-- hl(0, "SpecialChar", { fg = "#C1C88D" })
-- hl(0, "SpecialKey", { fg = "#676767" })
-- hl(0, "Statement", { fg = "#cccccc" })
-- hl(0, "StatusLine", { fg = "#FFFEDB", bg = "#34383C" })
-- hl(0, "String", { fg = "#A2A970" })
-- hl(0, "Structure", { fg = "#AA9AAC" })
-- hl(0, "Substitute", { fg = "#1A1A1A", bg = "#C1C88D" })
-- hl(0, "TabLine", { fg = "#A09998", bg = "#212121" })
-- hl(0, "TabLineFill", { fg = "#A09998", bg = "#212121" })
-- hl(0, "TabLineSel", { fg = "#A09998", bg = "#40474F" })
-- hl(0, "Title", { fg = "#FFFEDB" })
-- hl(0, "Todo", { fg = "#8B9698" })
-- hl(0, "Type", { fg = "#E3D896" })
-- hl(0, "Underlined", { undercurl = true })
-- hl(0, "VertSplit", { fg = "#303030" })
-- hl(0, "Visual", { bg = "#454545" })
-- hl(0, "WarningMsg", { fg = "#FFFEDB" })
-- hl(0, "Float", { fg = "#6f7b68" })
-- hl(0, "Number", { fg = "#6f7b68" })
-- hl(0, "Boolean", { fg = "#6f7b68" })
-- hl(0, "WinSeparator", { fg = "#888888", bg = "#111111" })
--
-- -- Tree-sitter fix for Markdown inline links
-- hl(0, "@markup.link.label.markdown_inline", {})
