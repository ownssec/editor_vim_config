-- Your existing Neovim config

require("plugins")
require("settings")
require("keymap")
require("config.customBufferLists")

local bgColor = "#191616"

-- Function to force background highlights
local function force_bg_highlights()
	vim.cmd("highlight! NvimTreeNormal guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! NvimTreeNormalNC guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! TermNormal guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! TermNormalNC guibg=" .. bgColor .. " guifg=NONE")
	vim.cmd("highlight! NormalFloat guibg=" .. bgColor .. " guifg=NONE")
end

-- Apply now
force_bg_highlights()

-- Re-apply on ColorScheme change to prevent overrides
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		force_bg_highlights()
	end,
})

vim.lsp.set_log_level("off") -- Disable LSP logging
vim.g.neo_tree_log_to_file = 0 -- Disable NeoTree logs (if using NeoTree)
vim.g.loaded_netrwPlugin = 2 -- Disable file explorer logs (if applicable)

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local log_path = vim.fn.expand(".nvimlog")
		if vim.fn.filereadable(log_path) == 1 then
			os.remove(log_path)
		end
	end,
})



-- Create a custom command to grep the parent directory using ripgrep

vim.api.nvim_create_user_command("ParentGrep", function()
  vim.ui.input({ prompt = "Search (ripgrep) in parent dir: " }, function(input)
    if not input or input == "" then return end

    local parent_dir = vim.fn.expand("%:p:h:h")
    local rg_cmd = { "rg", "-i", "--vimgrep", input, parent_dir }  -- <- added -i here

    vim.fn.setqflist({}, 'r')  -- Reset quickfix list

    vim.fn.jobstart(rg_cmd, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.fn.setqflist({}, 'a', { lines = data })
          vim.cmd("copen")
        end
      end,
      on_stderr = function(_, data)
        if data and data[1] ~= "" then
          vim.notify(table.concat(data, "\n"), vim.log.levels.WARN)
        end
      end,
      on_exit = function(_, code)
        if code ~= 0 then
          vim.notify("ripgrep exited with code " .. code, vim.log.levels.WARN)
        end
      end
    })
  end)
end, { desc = "Search parent dir using ripgrep (case-insensitive)" })

vim.keymap.set("n", "<C-x>", function()
  local is_open = false

  -- Check if any window is a quickfix window
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      is_open = true
      break
    end
  end

  if is_open then
    vim.cmd("ccl") -- Close quickfix window
  else
    vim.cmd("ParentGrep") -- Trigger your grep command
  end
end, { desc = "Toggle ParentGrep / close quickfix", noremap = true, silent = true })



vim.keymap.set("n", "<C-n>", function()
  local ok, _ = pcall(vim.cmd, "cnext")
  if not ok then
    vim.cmd("cfirst")
    vim.notify("Looped to first quickfix item", vim.log.levels.INFO)
  end
end, { desc = "Quickfix: Next (loop)", noremap = true, silent = true })

vim.keymap.set("n", "<C-p>", function()
  local ok, _ = pcall(vim.cmd, "cprevious")
  if not ok then
    vim.cmd("clast")
    vim.notify("Looped to last quickfix item", vim.log.levels.INFO)
  end
end, { desc = "Quickfix: Previous (loop)", noremap = true, silent = true })

