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
map({ 'n', 'v' }, ';', ':')
map({ 'n', 'v' }, "'", ';') -- Repeat last motion foward
map({ 'n', 'v' }, '"', ',') -- Repeat last motion backward
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('n', '<C-s>', '<cmd>w<cr>')
map('n', '<C-c>', '<cmd>checktime<cr>')
map({ 'n', 'v' }, 'q', '%')

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
-- TODO: To change that to require('telescope.builtin')
local telescope = require('telescope.builtin')
map({ 'n', 'v' }, '<leader>ts', '<cmd>Telescope treesitter<cr>')
map('n', '<leader>o', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>c', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>r', '<cmd>Telescope registers<cr>')
map('n', '<leader>/', function()
  telescope.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    -- winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzy find in the current buffer]' })
map('n', '<leader>j', '<cmd>Telescope jumplist<cr>')
map('n', '<leader>gd', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gbc', '<cmd>Telescope git_bcommits<cr>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_stash<cr>')
map('n', '<leader>km', '<cmd>Telescope keymaps<cr>')
map('n', '<leader>h', '<cmd>Telescope help_tags<cr>')


-- Just for documentation
-- map('n', 'gd', function() return require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor()) end)

-- Terminal
map({ 'n', 't', 'v' }, '<leader>t', '<cmd>ToggleTerm size=40<cr>')
map('t', ';q', '<cmd>ToggleTerm size=40<cr>')

-- Hop
map({ 'n', 'v' }, 'S', '<cmd>HopLineStart<cr>')
map({ 'n', 'v' }, 's', '<cmd>HopChar2<cr>')
