local map = function(modes, lhs, rhs, opts)
	-- Parameters:
	-- -- mode: string or table of strings with the modes
	-- -- lhs: keys to bind
	-- -- rhs: existing command or keybidding
	-- -- opts: self descriptive
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(modes, lhs, rhs, options)
end

--General
map({ 'n', 'v', 't' }, ';', ':')
map({ 'n', 'v' }, "'", ';') -- Repeat last motion foward
map({ 'n', 'v' }, '"', ',') -- Repeat last motion backward
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('n', '<C-s>', '<cmd>w<cr>', {desc = 'Salve Buffer'})
map('n', '<C-c>', '<cmd>checktime<cr>', {desc = 'Refresh Buffers'})
-- map({ 'n', 'v' }, 'q', '%')
map({ 'n', 'v' }, ',', '<Esc>,')

-- Moving
map({ 'n', 'v' }, 'J', '<C-f>')
map({ 'n', 'v' }, 'K', '<C-b>')

-- Buffer control
map('n', '<Tab><Tab>', '<esc><C-w><C-w>', { desc = 'Next [Buffer]' })
map('n', '<Tab>l', '<Esc><cmd>bn<cr>', { desc = 'Right [Buffer]' })
map('n', '<Tab>h', '<Esc><cmd>bp<cr>', { desc = 'Left [Buffer]' })
map('n', '<Tab>d', '<Esc><cmd>bnext<bar>bd#<cr>', { desc = 'Delete [Buffer]' }) --- TODO: create function in lua that creates new buffer if the current is the one being deleted and is the last one
map('n', '<Tab>v', '<Esc><cmd>vert<space>sbNext<cr>', { desc = 'Split Vertical with next [Buffer]' })

-- NvimTree
map({ 'n', 'v' }, '<leader>n', '<cmd>NvimTreeFindFileToggle<cr>', { desc = 'NvimTree focus file toggle' })
map({ 'n', 'v' }, '<leader>t', '<cmd>NvimTreeToggle<cr>', { desc = 'NvimTree toggle' })

-- Telescope
local telescope = require('telescope.builtin')
map({ 'n', 'v' }, '<leader>ss', telescope.treesitter, { desc = '[S]earch [S]ymbols' })
map({ 'n', 'v' }, '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
map({ 'n', 'v' }, '<leader>sw', telescope.live_grep, { desc = '[S]earch in [W]orkspace' })
map({ 'n', 'v' }, '<leader>sc', telescope.grep_string, { desc = '[S]earch String Under [C]ursor' })
map({ 'n', 'v' }, '<leader>sb', telescope.buffers, { desc = '[S]earch [B]uffers' })
map({ 'n', 'v' }, '<leader>sg', telescope.git_files, { desc = '[S]earch [G]it Files' })
map({ 'n', 'v' }, '<leader>sr', telescope.registers, { desc = '[S]earch [R]egisters' })
map({ 'n', 'v' }, '<leader>sj', telescope.jumplist, { desc = '[S]earch [J]umplist' })
map({ 'n', 'v' }, '<leader>/', function()
	telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		-- winblend = 10,
		previewer = false
	})
end, { desc = '[/] Fuzzy find in the current buffer]' })
map({ 'n', 'v' }, '<leader>gd', telescope.git_status, { desc = '[G]it [D]iff' })
map({ 'n', 'v' }, '<leader>gc', telescope.git_commits, { desc = '[G]it [C]ommits' })
map({ 'n', 'v' }, '<leader>gbc', telescope.git_bcommits, { desc = '[G]it [B]ranch [C]ommits' })
map({ 'n', 'v' }, '<leader>gb', telescope.git_branches, { desc = '[G]it [B]ranches' })
map({ 'n', 'v' }, '<leader>gs', telescope.git_stash, { desc = '[G]it [S]tash' })
map({ 'n', 'v' }, '<leader>km', telescope.keymaps, { desc = '[K]ey[m]aps' })
map({ 'n', 'v' }, '<leader>h', telescope.help_tags, { desc = '[H]elp Neovim' })
map({ 'n', 'v' }, '<leader>o', telescope.oldfiles, { desc = 'Last Opened Files. [O]ld files' })


-- Just for documentation
-- map('n', 'gd', function() return require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor()) end)

-- Terminal
map({ 'n', 't', 'v' }, '<leader>t', '<cmd>ToggleTerm size=40<cr>')
map('t', ':q', '<cmd>ToggleTerm size=40<cr>')

-- Hop
map({ 'n', 'v' }, 'S', '<cmd>HopLine<cr>', {desc = 'Jump to line'})
map({ 'n', 'v' }, 's', '<cmd>HopChar2<cr>', {desc = 'Jump to 2 characters'})
