-- lua/configs/lsp.lua

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

local protocol = require("vim.lsp.protocol")

-- Common on_attach function for all LSP servers
local on_attach = function(client, bufnr)
    -- Format on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr }) -- Use the correct format method
            end,
        })
    end

    -- LSP keymaps
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Ensure LSP servers are installed before attempting setup
local lsp_servers = {
    "ts_ls",     -- JavaScript/TypeScript LSP (corrected from "ts_ls")
    "cssls",     -- CSS LSP
    "tailwindcss", -- Tailwind CSS LSP
    "lua_ls",    -- Lua LSP (for Neovim config)
    "intelephense", -- PHP LSP (Laravel)
    "jsonls",    -- JSON LSP
}

for _, server in ipairs(lsp_servers) do
    nvim_lsp[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end
