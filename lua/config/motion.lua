-- lua/configs/motion.lua

vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings

-- Custom key mappings
-- vim.api.nvim_set_keymap("n", "]n", "<Plug>(easymotion-j)", {})
-- vim.api.nvim_set_keymap("n", "[p", "<Plug>(easymotion-k)", {})

-- Two-character search
vim.api.nvim_set_keymap("n", "f", "<Plug>(easymotion-s2)", {})
