local cmd = vim.cmd --- to execute string as vim command
local g = vim.g      -- to access global variables
local opt = vim.opt  -- to set options

require('plugins')
require('telescope-setup')
require('treesitter-setup')
require('bufferline-setup')
require('lualine-setup')
require('nerdtree-setup')
require('lsp-setup')
require('cmp-setup')

opt.number = true
opt.cursorline = true
opt.splitright = true
opt.termguicolors = true
opt.cursorline = true
opt.visualbell = true
opt.smartcase = true
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.clipboard = 'unnamed'
opt.mouse = 'a'
opt.laststatus = 3
opt.shiftwidth = 4
opt.list = true
-- opt.listchars:append "eol:↵" -- other options( ↩ , ↴ , ↵ )
opt.listchars:append "trail:·"
opt.breakindent = true
opt.linebreak = true
g.mapleader = ','
g.maplocalleader = '\\'

-- Theme
local theme = 'onedark'
cmd(string.format([[colorscheme %s]], theme))

-- tmux nav
cmd([[let g:tmux_navigator_disable_when_zoomed = 1]])

-- Helper function for mapping
local function map(modes, lhs, rhs, opts)
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
map({'n', 'v'}, ';', ':')
map('i', 'jk', '<Esc>')
map('i', 'JK', '<Esc>')
map('n', '<C-s>', '<cmd>w')

-- Moving
-- TODO: test the '{' and '}'
map({'n', 'v'}, 'J', '<C-f>')
map({'n', 'v'}, 'K', '<C-b>')

-- Buffer control
map('n', '<Tab><Tab>', '<esc><C-w><C-w>')
map('n', '<Tab>l', '<Esc><cmd>bn<cr>')
map('n', '<Tab>h', '<Esc><cmd>bp<cr>')
map('n', '<Tab>d', '<Esc><cmd>bdelete<cr>')
map('n', '<Tab>v', '<Esc><cmd>vert<space>sbNext<cr>')
--
-- NvimTree
map({'n', 'v'}, '<leader>n', '<cmd>NvimTreeToggle<cr>')
map({'n', 'v'}, '<leader>d', '<cmd>NvimTreeToggle<cr>')
-- Telescope
map('n', '<leader>t', '<cmd>Telescope treesitter<cr>')
map('n', '<leader>o', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>f', '<cmd>Telescope find_files<cr>')
map('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>h', '<cmd>Telescope builtin<cr>')
map('n', '<leader>r', '<cmd>Telescope registers<cr>')
map('n', '<leader>bg', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>j', '<cmd>Telescope jumplist<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gbc', '<cmd>Telescope git_bcommits<cr>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>k', '<cmd>Telescope keymaps<cr>')
map('n', 'gr', '<cmd>Telescope lsp_references<cr>')

