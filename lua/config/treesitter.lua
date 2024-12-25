local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
  return
end

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "lua", "vim", "vimdoc", "query", "html", "css", "javascript", "json", "php", 
    "scss", "slint", "sql", "tsx", "typescript", "python", "bash", "markdown", 
    "markdown_inline", "regex", "vue"
  },
  sync_install = true,
  auto_install = true,
  
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  
  indent = {
    enable = true,
  },
}

