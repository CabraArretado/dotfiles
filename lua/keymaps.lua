local map = require('helpers').map

--General 
map({'n', 'v'}, ';', ':')
map({'n', 'v'}, "'", ';') -- Repeat last motion foward
map({'n', 'v'}, '"', ',') -- Repeat last motion backward
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('n', '<C-s>', '<cmd>w<cr>')
map('n', '<C-c>', '<cmd>checktime<cr>')
map({'n', 'v'}, 'q', '%')

-- Moving
-- TODO: test the '{' and '}'
map({'n', 'v'}, 'J', '<C-f>')
map({'n', 'v'}, 'K', '<C-b>')

-- Buffer control
map('n', '<Tab><Tab>', '<esc><C-w><C-w>')
map('n', '<Tab>l', '<Esc><cmd>bn<cr>')
map('n', '<Tab>h', '<Esc><cmd>bp<cr>')
map('n', '<Tab>d', '<Esc><cmd>bnext<bar>bd#<cr>')
map('n', '<Tab>v', '<Esc><cmd>vert<space>sbNext<cr>')

-- NvimTree
map({'n', 'v'}, '<leader>n', '<cmd>NvimTreeFindFileToggle<cr>')
map({'n', 'v'}, '<leader>d', '<cmd>NvimTreeToggle<cr>')

-- Telescope
map({'n', 'v'}, '<leader>ts', '<cmd>Telescope treesitter<cr>')
map('n', '<leader>o', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>r', '<cmd>Telescope registers<cr>')
map('n', '<leader>fb', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>j', '<cmd>Telescope jumplist<cr>')
map('n', '<leader>gd', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gbc', '<cmd>Telescope git_bcommits<cr>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_stash<cr>')
map('n', '<leader>km', '<cmd>Telescope keymaps<cr>')


-- Just for documentation
-- map('n', 'gd', function() return require('telescope.builtin').lsp_definitions(require('telescope.themes').get_cursor()) end)

-- Terminal
map({'n', 't', 'v'}, '<leader>t', '<cmd>ToggleTerm size=40<cr>')
map( 't', ';q', '<cmd>ToggleTerm size=40<cr>')

-- Hop
map({'n','v'}, 'S', '<cmd>HopLineStart<cr>')
map({'n','v'}, 's', '<cmd>HopChar2<cr>')


