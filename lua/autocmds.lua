local api = vim.api -- access the VIM Lua API

api.nvim_create_augroup("CreatedByMe", { clear = false })
-- Highlight on yank
api.nvim_create_autocmd("TextYankPost",
	{ group = "CreatedByMe", callback = function() vim.highlight.on_yank({ timeout = 300 }) end })

-- Lua formatting
api.nvim_create_autocmd("FileType", {
	group = "CreatedByMe",
	pattern = '*.lua',
	callback = function()
		vim.bo[0].expandtab = true
		vim.bo[0].shiftwidth = 2
	end
})

-- TS to work with Terraform files
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" },
	{ group = "CreatedByMe", pattern = '*.tf', command = [[set filetype=hcl]] })
----
