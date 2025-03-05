--lua/configs/gitsigns.lua

local status, conform = pcall(require, "conform")
if not status then
    return
end

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        -- php = { "php-cs-fixer" },
        -- blade = { "blade-formatter" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        -- http = { "prettier" }, -- Use Prettier for .http files
        json = { "jq" }, -- Use jq for .json files
        http = { "kulala" },
    },
    formatters = {
        prettier = {
            prepend_args = {
                "--tab-width",
                "2",        -- Set tab spacing to 2 spaces
                "--use-tabs",
                "false",    -- Force spaces instead of tabs
                "--print-width",
                "80",       -- Set line width to 80 characters
                "--plugin",
                "prettier-plugin-http", -- Add the http plugin
            },
        },
        kulala = {
            command = "kulala-fmt",
            args = { "format", "$FILENAME" },
            stdin = false,
        },
        jq = {
            command = "jq",
            args = { "." },
            stdin = true,
        },
        ["blade-formatter"] = {
            prepend_args = { "--indent-size", "2" }, -- Set Blade template indentation
        },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Use LSP if no formatter is found
    },
})
