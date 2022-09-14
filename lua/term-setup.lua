require("toggleterm").setup{
    open_mappings = true,
    terminal_mappings = true,
    insert_mappings = true,
    direction = 'float',
    size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
}
