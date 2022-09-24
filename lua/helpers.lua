-- HELPER FUNCTIONS FOR CONFIGURATIONS

local helpers = {}

-- Helper function for mapping
function helpers.map(modes, lhs, rhs, opts)
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

return helpers
