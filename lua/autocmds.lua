local api = vim.api -- access the VIM Lua API

local myGroup = api.nvim_create_augroup("CreatedByMe", { clear = true })
-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  group = myGroup,
  callback = function() vim.highlight.on_yank({ timeout = 300 }) end
})

-- Lua formatting
api.nvim_create_autocmd("FileType", {
  group = myGroup,
  pattern = 'lua',
  callback = function()
    vim.bo[0].expandtab = true
    vim.bo[0].shiftwidth = 2
  end
})

-- TS to work with Terraform files
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = myGroup,
  pattern = '*.tf',
  command = [[set filetype=hcl]]
})
