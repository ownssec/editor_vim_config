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

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.opt.statuscolumn =
			"%s%=%{v:lnum == line('.') ? printf('~ %d', v:lnum) : printf('%d', abs(v:lnum - line('.')))}"
		vim.cmd("highlight EndOfBuffer guifg=Grey")
	end,
})

-- vim.api.nvim_set_hl(0, "Normal", { fg = "#d2d5d9", bg = "#181d24" })
-- vim.api.nvim_set_hl(0, "Comment", { fg = "#6a737d", italic = true })
-- vim.api.nvim_set_hl(0, "String", { fg = "#d2d5d9" })
-- vim.api.nvim_set_hl(0, "Number", { fg = "#F7A072" })
-- vim.api.nvim_set_hl(0, "Boolean", { fg = "#dca561" })
-- --
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a737d", bg = "#181d24" })
-- --
-- vim.api.nvim_set_hl(0, "Identifier", { fg = "#e2dce8" })
-- --
-- vim.api.nvim_set_hl(0, "Function", { fg = "#d2d5d9" })
