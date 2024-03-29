local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "?", action = "toggle_help" },
	{ key = "<C-k>", action = "" },
        { key = "<C-v>", action = "" },
        { key = "v", action = "vsplit" },
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
