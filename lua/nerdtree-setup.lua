require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "?", action = "toggle_help" },
        { key = "<C-k>", action = "" },
      },
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
