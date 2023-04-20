-- Place to install small plugins setups

local default_only_plugins = { 'hop', 'fidget' }

-- Setup Plugins just with default setup
for _, plugin in ipairs(default_only_plugins) do
  require(plugin).setup({})
end

require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

require('gitsigns').setup({
  signs = {
    add = { text = '++' },
    change = { text = '~~' },
    delete = { text = '__' },
    topdelete = { text = '‾‾' },
    changedelete = { text = '~~' },
  },
})

