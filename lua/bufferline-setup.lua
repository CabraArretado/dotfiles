vim.opt.termguicolors = true
require('bufferline').setup {
   options = {
	style = padded_slant,
	mode = 'buffers',
        indicator = {
                icon = '|',
                style = 'icon',
            },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        separator_style = "thin",
    }
}
