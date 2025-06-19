require("settings")
require("plugins")
require("keymap")

vim.cmd([[
  " Text input and background
  highlight NoiceCmdlinePopup guifg=#eeeeee guibg=#141415
  highlight NoiceCmdlinePopupBorder guifg=#181818 guibg=NONE

  " Enforced icon styling (by format override)
  highlight NoiceCmdlineIcon guifg=#eeeeee guibg=#141415
  highlight NoiceCmdlinePrompt guifg=#eeeeee guibg=#141415

  " Popup messages
  highlight NoicePopup guifg=#eeeeee guibg=#141415
  highlight NoicePopupBorder guifg=#181818 guibg=NONE

  " LSP title & mini messages
  highlight NoiceLspProgressTitle guifg=#eeeeee guibg=NONE
  highlight NoiceMini guifg=#eeeeee guibg=#141415
]])
