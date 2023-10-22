
require("plugins")

require("mason").setup()

vim.cmd("colorscheme tokyonight")
vim.cmd("set number")
vim.cmd("set hidden") vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set encoding=utf8")
vim.cmd("set history=5000")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set scl=no")


vim.g.leader = 'space' 

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-e>',     "<Cmd>:NvimTreeClose<CR>",                  opts('Help'))

end

vim.keymap.set('n', '<C-e>', '<Cmd>:NvimTreeToggle<CR>', { remap = true })

-- custom key
vim.keymap.set('n', '<C-j>', '<C-W>j', { remap = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { remap = true })
vim.keymap.set('n', '<C-h>', '<C-W>h', { remap = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { remap = true })



-- vim.keymap.set('t', '<esc>', function () return '<C-\>' or '<C-n>', { remap = true })

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end


-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
-- to avoid force close
vim.keymap.set('n', '<C-z>', '<Cmd>:u<CR>', { remap = true })
vim.keymap.set('i', '<C-z>', '<Cmd>:u<CR>', { remap = true })

-- remap this mason LSP
--vim.keymap.set('t', ':101', '<Cmd>:Mason<CR>', { remap = true })

--toggle term



vim.keymap.set('n', '<A-1>', '<Cmd>:ToggleTerm 1<CR>', { remap = true })
vim.keymap.set('i', '<A-1>', '<Cmd>:ToggleTerm 1<CR>', { remap = true })
vim.keymap.set('t', '<A-1>', '<Cmd>:ToggleTerm 1<CR>', { remap = true })

vim.keymap.set('n', '<A-2>', '<Cmd>:ToggleTerm 2<CR>', { remap = true })
vim.keymap.set('i', '<A-2>', '<Cmd>:ToggleTerm 2<CR>', { remap = true })
vim.keymap.set('t', '<A-2>', '<Cmd>:ToggleTerm 2<CR>', { remap = true })


vim.keymap.set('n', '<A-3>', '<Cmd>:ToggleTerm 3<CR>', { remap = true })
vim.keymap.set('i', '<A-3>', '<Cmd>:ToggleTerm 3<CR>', { remap = true })
vim.keymap.set('t', '<A-3>', '<Cmd>:ToggleTerm 3<CR>', { remap = true })


vim.keymap.set('n', '<A-4>', '<Cmd>:ToggleTerm 4<CR>', { remap = true })
vim.keymap.set('i', '<A-4>', '<Cmd>:ToggleTerm 4<CR>', { remap = true })
vim.keymap.set('t', '<A-4>', '<Cmd>:ToggleTerm 4<CR>', { remap = true })

-- toggleterm
require'toggleterm'.setup {
  shade_terminals = false
}


-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fw', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})


require('telescope').setup{ 
	defaults = 	{ 
		file_ignore_patterns = {
			"node_modules"
		}
	}} 

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}


 require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    install_root_dir = "./mason",

})
