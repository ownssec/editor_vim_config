-- lua/configs/git-conflict.lua

-- GitConflictChooseOurs — Select the current changes.
-- GitConflictChooseTheirs — Select the incoming changes.
-- GitConflictChooseBoth — Select both changes.
-- GitConflictChooseNone — Select none of the changes.
-- GitConflictNextConflict — Move to the next conflict.
-- GitConflictPrevConflict — Move to the previous conflict.
-- GitConflictListQf — Get all conflict to quickfix
require("git-conflict").setup({
	default_mappings = {
		ours = "o",
		theirs = "t",
		none = "0",
		both = "b",
		next = "n",
		prev = "p",
	},
})

-- Add this to your lua/configs/keymaps.lua or wherever you configure keymaps
vim.api.nvim_set_keymap("n", "<C-G>", ":GitConflictListQf<CR>", { noremap = true, silent = true })
