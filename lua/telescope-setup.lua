local present, telescope = pcall(require, "telescope")

if not present then
  return
end

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " 🔍  ",
    selection_caret = "  ",
    entry_prefix = "  ",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
      vertical = {
        mirror = false,
      },
      preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules" },
    path_display = { "truncate" },
    winblend = 0,
    border = true,
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ["J"] = "preview_scrolling_down",
        ["K"] = "preview_scrolling_up",
        ["v"] = "select_vertical",
      },
    },
  },
  pickers = {
    oldfiles = {
      only_cwd = true,
      initial_mode = 'normal',
    },
    lsp_definitions = {
      jump_type = 'never',
      initial_mode = 'normal',
    },
    jumplist = {
      initial_mode = 'normal',
    },
    registers = {
      initial_mode = 'normal',
    },
    git_status = {
      initial_mode = 'normal',
    },
    git_commits = {
      initial_mode = 'normal',
    },
    git_bcommits = {
      initial_mode = 'normal',
    },
    git_branches = {
      initial_mode = 'normal',
    },
    lsp_references = {
      initial_mode = 'normal',
    },
    lsp_incoming_calls = {
      initial_mode = 'normal',
    },
    lsp_dynamic_workspace_symbols = {
      initial_mode = 'normal',
    },
    git_stash = {
      initial_mode = 'normal',
    },
  }
}
