-- lua/configs/wilder.lua



local wilder = require("wilder")

wilder.setup({
  modes = { ":", "/", "?" },
  next_key = "<C-n>",
  previous_key = "<C-p>",
  accept_key = "<Tab>",
  reject_key = "<C-c>",
  use_python_remote_plugin = 0,
})

wilder.set_option('pipeline', {
  wilder.branch(
    -- Use fd and rg
    wilder.python_file_finder_pipeline({
      file_command = { 'rg', '--files' },  -- fastest option
      dir_command = { 'fd', '-td' },       -- fd for directories
      filters = { 'fuzzy_filter', 'difflib_sorter' },
    }),

    wilder.cmdline_pipeline({
      language = 'python',
      fuzzy = 1,
    }),

    wilder.python_search_pipeline({
      pattern = wilder.python_fuzzy_pattern(),
      sorter = wilder.python_difflib_sorter(),
      engine = 're',
      process_command = { 'rg', '--smart-case',  '--vimgrep' },
    })
  )
})

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
  left = { " ", wilder.popupmenu_devicons() },
  right = { " ", wilder.popupmenu_scrollbar() },
  pumblend = 10,
  highlights = {
    border = "WilderBorder",  -- Link to your custom highlight group
  },
    max_width = '35%', -- minimum height of the popupmenu, can also be a number
    min_width = '35%', -- minimum height of the popupmenu, can also be a number
    max_height = '20%', -- to set a fixed height, set max_height to the same value
    min_height = '20%', -- to set a fixed height, set max_height to the same value
    reverse = 0,        -- if 1, shows the candidates from bottom to top
  })
))

vim.api.nvim_set_hl(0, "WilderBorder", { fg = "#434241" })  -- pink border

