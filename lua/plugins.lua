-- 📂lua/🌑plugins.lua

-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
    -- Packer
    use("wbthomason/packer.nvim")

    -- Colorschema
    use("rebelot/kanagawa.nvim")

    -- Auto pairs
    use {
      'windwp/nvim-autopairs',
      config = function()
        local status, autopairs = pcall(require, "nvim-autopairs")
        if not status then
          return
        end

        autopairs.setup({
          disable_filetype = { "TelescopePrompt", "vim" },
        })
      end
    }

   -- Git
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns")
        end,
    })

    -- File tree: nvim-treesitter with TSUpdate
    use({
      'nvim-tree/nvim-tree.lua',
      config = function()
            require("config.nvimtree")
      end,
    })    

    -- File tree: nvim-treesitter with TSUpdate
    -- use({
    --   'nvim-treesitter/nvim-treesitter',
    --   run = ':TSUpdate',
    -- })    

   -- Terminal
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("config.toggleterm")
        end,
    })

    -- Background Transparent
    use({
        "xiyaowong/nvim-transparent",
        config = function()
            require("transparent").setup({
                enable = true,
                extra_groups = {
                    "BufferLineTabClose",
                    "BufferlineBufferSelected",
                    "BufferLineFill",
                    "BufferLineBackground",
                    "BufferLineSeparator",
                    "BufferLineIndicatorSelected",
                },
                exclude = {},
            })
        end,
    })
end)

